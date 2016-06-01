//
//  TableViewController.m
//  GPS-MapKit-ObjC
//
//  Created by Alistair Cooper on 5/30/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadJsonGCD];
    
    resturantCatArray = [NSMutableArray arrayWithObjects:
                         @"Thai", @"Pizza", @"Cafe", nil];
    
    [resturantCatArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
  //  NSLog(@"%@", resturantCatArray);
    
    
    
}


#pragma mark - Data setup methods
-(void)downloadJsonGCD
{
    // start pinwheel
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *urlString = @"https://s3-us-west-2.amazonaws.com/uclaiosclass/resturants.json";
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSData *jsonData = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
             resturantsArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
            
            [self.tableView reloadData]; // need to reload table data
            
        //    NSLog(@"%@", resturantsArray);
            
            // stop the pinwheel
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
        });
        
    });
    
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [resturantCatArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [resturantCatArray objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // gets category title from array using section as index
    NSString *sectionCatTitle = [resturantCatArray objectAtIndex:section];
    
    // use category name to make array of matching resturants
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", sectionCatTitle ];
    NSArray *filteredArray  = [resturantsArray filteredArrayUsingPredicate:predicate];
    
    return [filteredArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *customTableIdentifier = @"CustomTableCell";
    
    CustomTableViewCell *cell = (CustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:customTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // gets category title from array using section as index
    NSString *sectionCatTitle = [resturantCatArray objectAtIndex:indexPath.section];
    
    // use category name to make array of matching resturants
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", sectionCatTitle ];
    NSArray *filteredArray  = [resturantsArray filteredArrayUsingPredicate:predicate];
    
    // make a dictionary of just object at index path
    NSDictionary *resturantDict = [filteredArray objectAtIndex:indexPath.row];
    
    // label the cells using matching key values
    cell.nameLabel.text = [resturantDict objectForKey:@"name"];
    cell.categoryLabel.text = [resturantDict objectForKey:@"category"];
    cell.priceLabel.text = [resturantDict objectForKey:@"price"];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 70;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
