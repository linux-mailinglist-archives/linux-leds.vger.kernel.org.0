Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7C1458C4C
	for <lists+linux-leds@lfdr.de>; Mon, 22 Nov 2021 11:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbhKVKg0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Nov 2021 05:36:26 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33586 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229716AbhKVKg0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 22 Nov 2021 05:36:26 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMANmOC024917;
        Mon, 22 Nov 2021 10:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=jZE4fYxWDfY3w7gIDkUy/6c7HqYv0ANtu7Gyop0n5pA=;
 b=PxtXROFM6+aw6kHAPu+SejdhlJfgC1NJgcyNocGQZQPAmTVk4vYeF76Qk5adfKnnLRXr
 t+uDFvUt14kwCgGH7msoOD1AuL4OYUdNpB+4S+71Y0g1O4ITqXETEA1fi64HoalN4qqh
 7mi0jMOvtQ+PwxKukQUY274NTZ7xxSOh2Dl874VAoNK1pm1i2q+OlFCWCwf2MMvICmlZ
 DZ26ZiQ/6IwUBUUpXltz5qyvvTYEiDOAeN48R8pFEnrImlaGqvkBB7l1o+ISBwANX8xh
 7lOyZ7DHQTl7xT36rIjv0MFeBsD/qVwMXTA5vjorV0YEcpzrWP0xhWk5H0p62SMMevVj sQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cg69m8xur-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Nov 2021 10:33:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AMAUmjJ023580;
        Mon, 22 Nov 2021 10:33:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        by userp3030.oracle.com with ESMTP id 3cep4wfrmg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Nov 2021 10:33:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O12u2VOt98TxnCsuR9iQ+/KbQOIMkBlGrwAKbndKsezYTHYZWx+8sXEDsiG03jGfyHrQPl4EWSmksry+FkOaSHGXPaMl4PeQGyqtCuxzKUAc3KTLSzeM0cjAiZPhVVjoOn0Q1uXmhUPnzrBzmzHz6zI0adQQSgyoewgui5a7+xIbTprEXIhM4PRAn2WpPRwNaq6TTzlkCKs6eSxu+k0VuLQZHsfBjsySnooHl3kheDarlXNSvlRKfQEwpf68XNn7oXZDk932vwuiueaiO8D/K6iCFGq9prO5S+wPmNG/BcY9TvMbiEZrpNzolWCj6aE2B0l6Tpn4bNipEn3FUu+rpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZE4fYxWDfY3w7gIDkUy/6c7HqYv0ANtu7Gyop0n5pA=;
 b=a7O91rKXkMqCGLExZKZYvqhQRcySicOtQsz8MCHJj9IhLgoS0vyi/bAS1DgTbf74Urq78WS8n+gcPzUKIA465kuhMvJJISpCJiFldkoiQ6gJs0qzcq1SbH9uuFe0c5dBJ/EBk/puI7o1Y0yDkqoIHRxalg6cMItOnXSYG7gEpfIsMNynUhoB21P/VFBBqk8rVHsTRb/q75V3Z5ElRmcoqMB7sSRblPUhqB8+QLrH1A9aewVVKVSHvtuhMglopDgAUabH7SjKVgSYGxhJbZzIbOlJ/n6MMacpGQbrs+c5LLz9YGG6vw8vCkA+7FrFll7uH8uTqF5WiXFtPRgOrLx7VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZE4fYxWDfY3w7gIDkUy/6c7HqYv0ANtu7Gyop0n5pA=;
 b=HttYvNSow+kiXoUyk4ADm6Igrph5C1ZO3WK0WeOHo6JK0cgAyRKM4cnh/sy8rKD3d1+RhTeatoS5AGlRKevzHjk4lPf/0rNWKKrGbnEz+Xikq6CTApdRMesqxB8H8DCQ2TV4lcKGma3Hkr2Jr3pcglgXqghUFTfB21eCZCnYVco=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1775.namprd10.prod.outlook.com
 (2603:10b6:301:a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Mon, 22 Nov
 2021 10:33:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682%6]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 10:33:04 +0000
Date:   Mon, 22 Nov 2021 13:32:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Florian Eckert <fe@dev.tdt.de>, pavel@ucw.cz,
        robh+dt@kernel.org, Eckert.Florian@googlemail.com
Cc:     lkp@intel.com, kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH 1/2] leds: ktd20xx: Add the KTD20xx family of the RGB
 LEDs driver from Kinetic
Message-ID: <202111201421.udM6bJHl-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109100822.5412-2-fe@dev.tdt.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 10:32:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14c64ca7-ef31-41a2-793b-08d9ada3773a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1775:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1775F994CA9CA635801F5C328E9F9@MWHPR10MB1775.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KCONNtPk59X0z+fmmB6zkcyBXocZRRFHvycUF2LM2xQ9GUZGf9Sr0wbw/9WXZCv3A/6gbS9f5YfdXF9eX+ZGea8gLFRj5Rn+e+8PVPheVwyvYZMxn8/4AwLZa/OUqgJvGCamY0NeVykFQlqDNqV1HRx7g/QomKj8irD90IH9rotvLj29Kq5VZJeyMTkDFtbKKzhc967W92Z9c2a9VGet3ipRUhCvCcxGuaWe8Ai7iBoefTrcfYE4taM7s6YIJ7Ff9ZAVv36nrbzMxRfsTYKvTJ804DV1VRBo2SFQE8JO74bWCnfKZJgKPnn9VwLhbNvLz7RPe+7itl7vVYhaF85KZW341c3T5ziOZm8Uy9aJS0Mcxl3cyiUF/mqOmMjiaMhgXYJp4+g2rAe3kfy8gM0iqpDD0/xpcbDrlMmCO8bcwsCjJd8DDdeRNvF3kDnDxHONYNM95d+xK7Op8RtNoPVuULm52KrEkKIEfBMvmxtj1ruHTmVO/CQniqbHi4EHSt2WLziYHxcd6bGAIuiJF6CElEX5w1P36/EtbCQm/qAjP6I0p6ieDPw/1AWPtQTNkm1cMiDtb1ngcVbYbXoXiy8Glml7YyaPMj4blpY5YPBK6jNSCtrC3zmpEPErLUyn2gI2qEYWzYl/LsuCXZjRr+Y2zgxFvrFUXVSrH2H4cv7tK5jH9ag6e1J64wnXN1U7IyR+bWVSQsP3QPyXo9BtKeBQlEPMCW5yiK/9zPrPa2Wt8RbY0/KB1QPe443tUKyU62wLfC/EEJEi1H3b7HvUxiRdGc1wTSSi2lZxEeUKGxF5/url+It0FvqYH2XXdIK7nbrirhPZEDhVG7lN013SjQ9qWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(36756003)(38350700002)(38100700002)(508600001)(6486002)(966005)(7416002)(316002)(83380400001)(30864003)(44832011)(8936002)(9686003)(86362001)(6666004)(26005)(6496006)(956004)(4326008)(52116002)(186003)(5660300002)(2906002)(1076003)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k+a9LqLPe9zBBRa8/N+5k7r+DkmNpJvtVRdW8QIKjpdTAgErW8/6e+o1Nt1E?=
 =?us-ascii?Q?TtK790Y/yD6fwtFwOlLovxf1g36LZ25A2oJlAdjlAb6uukViYyslsjnS2Gdt?=
 =?us-ascii?Q?Jic39KFM0kJMIv+k7GmgywtoEaeE3j1jpWnUL0Grj41DTAHHpdiVbP5iocL2?=
 =?us-ascii?Q?mwmU/Hmyd/F0KKlSs3FTjaEo4kF4lb7OF3Sz/n7oPfBFWBxnE3lzZ9yEq6LR?=
 =?us-ascii?Q?61AaUj+Qz+BfWJoh0/hgDM0wWRW29EwHgkdWcjOsSyGa2AgIcEdriA9ayjYq?=
 =?us-ascii?Q?1kjyqDhLlRhGbbAeCfhCZxHmPZ0AkIqe7nCz5cp7htg9I21drCO7gOHLRjgr?=
 =?us-ascii?Q?bcsdesdgTC8XY+mG1+3WidVq6NcUaTpe7Xoz7iZ/yk6mPPpU3LeFJDMPaS6B?=
 =?us-ascii?Q?yo6yKX/ZXi4HpRqB6MfQAHAWyc2sOLXCpZR2+oKieHlMdwNTIJrBMi4f4+SS?=
 =?us-ascii?Q?SOXsQ4RC1N5SNvCx7F+PbpxRfON3XtZFhSONTC+SG6hCFESsmk771bvONkmo?=
 =?us-ascii?Q?+/2i9GLVgjGSEuai38Bkl87+Z3Jx9sLSmspINei59VzKlre41e3P3g/NmRWw?=
 =?us-ascii?Q?H6ig0mLTBZuy+h+dhtt3L/+8CrFAkSpU1yshiVFhqtr4tRqJwJDJ2kSnZIkG?=
 =?us-ascii?Q?7sEN6l0+EyEYiTrpHK7X5JpqT2lTvazkH4W9nXDwvKumou5pKO7mPQl8oS8y?=
 =?us-ascii?Q?rKYLgaeSZsHjkXjDcbAS7/M9ZK84p1U9MvaBMSw4sVjVMwUqox62TjgD7/Sw?=
 =?us-ascii?Q?gvMkBIFEswLax+1bYDYpPvev9U3BPqCdqWl+LsTzef4ebXWP1jSfSJ+mt7W5?=
 =?us-ascii?Q?aVB2QomV9y8Pcj1N0k/UCnPs4GI+hjFCZ93xsJ+zpA86kmRtsLRJQ6nt7DEZ?=
 =?us-ascii?Q?6i85PCWwjSMxdp4tltnTFWB4ZYrn4O2orsLIt9c14wn8zaW8jNk6DcJohZNy?=
 =?us-ascii?Q?Q/7nP5JrPe8dSfTl5EeYsagsrdnaWgedtPZ1ndfDJJOei1Lu1h1ppEmgxSfs?=
 =?us-ascii?Q?CyRyEZeh7FLVZ1qSsEpcJctoSRegdVTdW4gLDhhxeRAhb0NUHNwIM83MKxqy?=
 =?us-ascii?Q?+GEDBmhAEJNbYdVbSIa3x4iWS26agbLKOU++NqLR7fZvym+Os77H3PkVAxNL?=
 =?us-ascii?Q?sdHw9xz0PmwzjZYN2FEB3MEqC0jyzzYyiISBRG+iH4amqdliQDq2emqPwudc?=
 =?us-ascii?Q?40Gu47rgXrQ1Th6+Q5ntMWpSBBJPjToyqie6nCBBj7U5KXnLaMXy95TBoGAo?=
 =?us-ascii?Q?7NBwMG+EFVrN9yH5Kv5IdlXfBS/K7zNZ1k5fOLqdHFQJOmt+7gV3l/utatgd?=
 =?us-ascii?Q?XRzjfltv/G08/yt2FZZulRMKa31Zxt9oEvs69EwMefRRgEg7AP2ojvl6JsSG?=
 =?us-ascii?Q?ZPFpRDgA0A4xoR1z1rGDMZBP5R95lExn/Dl0E1Nw0ObctK/+F6Khq/xHyGDG?=
 =?us-ascii?Q?ZUi/E+k96Q5PIdUuXqAABJOdG1NJkiKwWL/YBAl8OXfdqaP/OE7oZ1QfSXSs?=
 =?us-ascii?Q?4dVXjpNbbIq3TYbxEr/yBAYzGMDf4JRHrwngTrR1r7dRnezPTIU4ghc3kZrT?=
 =?us-ascii?Q?j5r+CPT4EJ8jt1lo03OleVFVa+GNl7Zv45AEdzq4CNf/dRbrBvZD3nSfctpd?=
 =?us-ascii?Q?+nk4qBOpgOIl28kAwMWWAtyw21jJFJBKrubg/sFzB8GeW+/7iOveKOwNFPlT?=
 =?us-ascii?Q?f79DR8+mF8YoEMYCcIwiId7PyGE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c64ca7-ef31-41a2-793b-08d9ada3773a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:33:04.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c03wj5e732udZRmof3WC22cUXHK5jSxzwTClI7O38UzC1143ktERSPgW1pPIb2pew1Nso82sHznJoifOWBix8nm3PMnqwrfzGqJUcpfJPAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1775
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10175 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220055
X-Proofpoint-GUID: l6NFmzhiYUZ_XGGg7A2-kLmKYNrLXNH7
X-Proofpoint-ORIG-GUID: l6NFmzhiYUZ_XGGg7A2-kLmKYNrLXNH7
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Florian,

url:    https://github.com/0day-ci/linux/commits/Florian-Eckert/leds-Add-KTD20xx-RGB-LEDs-driver-from-Kinetic/20211109-181728
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: i386-randconfig-m031-20211115 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/leds-ktd20xx.c:304 ktd20xx_probe_dt() warn: missing error code 'ret'
drivers/leds/leds-ktd20xx.c:492 current_color0_store() warn: unsigned 'value[i]' is never less than zero.
drivers/leds/leds-ktd20xx.c:566 current_color1_store() warn: unsigned 'value[i]' is never less than zero.
drivers/leds/leds-ktd20xx.c:661 faderate_store() warn: unsigned 'faderate' is never less than zero.

vim +/ret +304 drivers/leds/leds-ktd20xx.c

004e74105bb360 Florian Eckert 2021-11-09  281  static int ktd20xx_probe_dt(struct ktd20xx *chip)
004e74105bb360 Florian Eckert 2021-11-09  282  {
004e74105bb360 Florian Eckert 2021-11-09  283  	struct fwnode_handle *child = NULL;
004e74105bb360 Florian Eckert 2021-11-09  284  	struct led_init_data init_data = {};
004e74105bb360 Florian Eckert 2021-11-09  285  	struct led_classdev *led_cdev;
004e74105bb360 Florian Eckert 2021-11-09  286  	struct ktd20xx_led *led;
004e74105bb360 Florian Eckert 2021-11-09  287  	struct device *dev = &chip->client->dev;
004e74105bb360 Florian Eckert 2021-11-09  288  	u8 value[3] = { 0, 0, 0 };
004e74105bb360 Florian Eckert 2021-11-09  289  	int i = 0;
004e74105bb360 Florian Eckert 2021-11-09  290  	int ret = -EINVAL;
004e74105bb360 Florian Eckert 2021-11-09  291  	int color;
004e74105bb360 Florian Eckert 2021-11-09  292  
004e74105bb360 Florian Eckert 2021-11-09  293  	device_for_each_child_node(chip->dev, child) {
004e74105bb360 Florian Eckert 2021-11-09  294  		led = &chip->leds[i];
004e74105bb360 Florian Eckert 2021-11-09  295  
004e74105bb360 Florian Eckert 2021-11-09  296  		ret = fwnode_property_read_u32(child, "reg", &led->index);
004e74105bb360 Florian Eckert 2021-11-09  297  		if (ret) {
004e74105bb360 Florian Eckert 2021-11-09  298  			dev_err(dev, "missing property: reg\n");
004e74105bb360 Florian Eckert 2021-11-09  299  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  300  		}
004e74105bb360 Florian Eckert 2021-11-09  301  		if (led->index >= KTD20XX_MAX_LEDS) {
004e74105bb360 Florian Eckert 2021-11-09  302  			dev_warn(dev, "property 'reg' must contain value between '0' and '%i'\n",
004e74105bb360 Florian Eckert 2021-11-09  303  					KTD20XX_MAX_LEDS);

ret = -EINVAL;

004e74105bb360 Florian Eckert 2021-11-09 @304  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  305  		}
004e74105bb360 Florian Eckert 2021-11-09  306  
004e74105bb360 Florian Eckert 2021-11-09  307  		ret = fwnode_property_read_u32(child, "color", &color);
004e74105bb360 Florian Eckert 2021-11-09  308  		if (ret) {
004e74105bb360 Florian Eckert 2021-11-09  309  			dev_err(dev, "missing property: color\n");
004e74105bb360 Florian Eckert 2021-11-09  310  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  311  		}
004e74105bb360 Florian Eckert 2021-11-09  312  		if (color != LED_COLOR_ID_RGB) {
004e74105bb360 Florian Eckert 2021-11-09  313  			dev_warn(dev, "property 'color' must contain value 'LED_COLOR_ID_RGB'\n");

ret = -EINVAL;

004e74105bb360 Florian Eckert 2021-11-09  314  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  315  		}
004e74105bb360 Florian Eckert 2021-11-09  316  
004e74105bb360 Florian Eckert 2021-11-09  317  		/* Get default color register selection */
004e74105bb360 Florian Eckert 2021-11-09  318  		if (fwnode_property_read_u8_array(child, "kinetic,color-selection", value, 3))
004e74105bb360 Florian Eckert 2021-11-09  319  			dev_warn(dev, "no kinetic,color-selection property found, use default rgbt color selection from register 0.\n");
004e74105bb360 Florian Eckert 2021-11-09  320  
004e74105bb360 Florian Eckert 2021-11-09  321  		led->subled_info[0].color_index = LED_COLOR_ID_RED;
004e74105bb360 Florian Eckert 2021-11-09  322  		led->subled_info[0].channel = 0;
004e74105bb360 Florian Eckert 2021-11-09  323  		led->subled_info[0].intensity = value[0];
004e74105bb360 Florian Eckert 2021-11-09  324  		led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
004e74105bb360 Florian Eckert 2021-11-09  325  		led->subled_info[1].channel = 1;
004e74105bb360 Florian Eckert 2021-11-09  326  		led->subled_info[1].intensity = value[1];
004e74105bb360 Florian Eckert 2021-11-09  327  		led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
004e74105bb360 Florian Eckert 2021-11-09  328  		led->subled_info[2].channel = 2;
004e74105bb360 Florian Eckert 2021-11-09  329  		led->subled_info[2].intensity = value[2];
004e74105bb360 Florian Eckert 2021-11-09  330  
004e74105bb360 Florian Eckert 2021-11-09  331  		led->mc_cdev.subled_info = led->subled_info;
004e74105bb360 Florian Eckert 2021-11-09  332  		led->mc_cdev.num_colors = KTD20XX_LED_CHANNELS;
004e74105bb360 Florian Eckert 2021-11-09  333  
004e74105bb360 Florian Eckert 2021-11-09  334  		init_data.fwnode = child;
004e74105bb360 Florian Eckert 2021-11-09  335  
004e74105bb360 Florian Eckert 2021-11-09  336  		led->chip = chip;
004e74105bb360 Florian Eckert 2021-11-09  337  		led_cdev = &led->mc_cdev.led_cdev;
004e74105bb360 Florian Eckert 2021-11-09  338  		led_cdev->brightness_set_blocking = ktd20xx_brightness_set;
004e74105bb360 Florian Eckert 2021-11-09  339  
004e74105bb360 Florian Eckert 2021-11-09  340  		switch (led->index) {
004e74105bb360 Florian Eckert 2021-11-09  341  		case RGB_A1:
004e74105bb360 Florian Eckert 2021-11-09  342  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  343  					chip->regmap, kt20xx_a1_select);
004e74105bb360 Florian Eckert 2021-11-09  344  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  345  					chip->regmap, kt20xx_a1_enable);
004e74105bb360 Florian Eckert 2021-11-09  346  			break;
004e74105bb360 Florian Eckert 2021-11-09  347  		case RGB_A2:
004e74105bb360 Florian Eckert 2021-11-09  348  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  349  					chip->regmap, kt20xx_a2_select);
004e74105bb360 Florian Eckert 2021-11-09  350  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  351  					chip->regmap, kt20xx_a2_enable);
004e74105bb360 Florian Eckert 2021-11-09  352  			break;
004e74105bb360 Florian Eckert 2021-11-09  353  		case RGB_A3:
004e74105bb360 Florian Eckert 2021-11-09  354  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  355  					chip->regmap, kt20xx_a3_select);
004e74105bb360 Florian Eckert 2021-11-09  356  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  357  					chip->regmap, kt20xx_a3_enable);
004e74105bb360 Florian Eckert 2021-11-09  358  			break;
004e74105bb360 Florian Eckert 2021-11-09  359  		case RGB_A4:
004e74105bb360 Florian Eckert 2021-11-09  360  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  361  					chip->regmap, kt20xx_a4_select);
004e74105bb360 Florian Eckert 2021-11-09  362  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  363  					chip->regmap, kt20xx_a4_enable);
004e74105bb360 Florian Eckert 2021-11-09  364  			break;
004e74105bb360 Florian Eckert 2021-11-09  365  		case RGB_B1:
004e74105bb360 Florian Eckert 2021-11-09  366  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  367  					chip->regmap, kt20xx_b1_select);
004e74105bb360 Florian Eckert 2021-11-09  368  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  369  					chip->regmap, kt20xx_b1_enable);
004e74105bb360 Florian Eckert 2021-11-09  370  			break;
004e74105bb360 Florian Eckert 2021-11-09  371  		case RGB_B2:
004e74105bb360 Florian Eckert 2021-11-09  372  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  373  					chip->regmap, kt20xx_b2_select);
004e74105bb360 Florian Eckert 2021-11-09  374  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  375  					chip->regmap, kt20xx_b2_enable);
004e74105bb360 Florian Eckert 2021-11-09  376  			break;
004e74105bb360 Florian Eckert 2021-11-09  377  		case RGB_B3:
004e74105bb360 Florian Eckert 2021-11-09  378  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  379  					chip->regmap, kt20xx_b3_select);
004e74105bb360 Florian Eckert 2021-11-09  380  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  381  					chip->regmap, kt20xx_b3_enable);
004e74105bb360 Florian Eckert 2021-11-09  382  			break;
004e74105bb360 Florian Eckert 2021-11-09  383  		case RGB_B4:
004e74105bb360 Florian Eckert 2021-11-09  384  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  385  					chip->regmap, kt20xx_b4_select);
004e74105bb360 Florian Eckert 2021-11-09  386  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  387  					chip->regmap, kt20xx_b4_enable);
004e74105bb360 Florian Eckert 2021-11-09  388  			break;
004e74105bb360 Florian Eckert 2021-11-09  389  		case RGB_C1:
004e74105bb360 Florian Eckert 2021-11-09  390  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  391  					chip->regmap, kt20xx_c1_select);
004e74105bb360 Florian Eckert 2021-11-09  392  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  393  					chip->regmap, kt20xx_c1_enable);
004e74105bb360 Florian Eckert 2021-11-09  394  			break;
004e74105bb360 Florian Eckert 2021-11-09  395  		case RGB_C2:
004e74105bb360 Florian Eckert 2021-11-09  396  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  397  					chip->regmap, kt20xx_c2_select);
004e74105bb360 Florian Eckert 2021-11-09  398  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  399  					chip->regmap, kt20xx_c2_enable);
004e74105bb360 Florian Eckert 2021-11-09  400  			break;
004e74105bb360 Florian Eckert 2021-11-09  401  		case RGB_C3:
004e74105bb360 Florian Eckert 2021-11-09  402  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  403  					chip->regmap, kt20xx_c3_select);
004e74105bb360 Florian Eckert 2021-11-09  404  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  405  					chip->regmap, kt20xx_c3_enable);
004e74105bb360 Florian Eckert 2021-11-09  406  			break;
004e74105bb360 Florian Eckert 2021-11-09  407  		case RGB_C4:
004e74105bb360 Florian Eckert 2021-11-09  408  			led->select = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  409  					chip->regmap, kt20xx_c4_select);
004e74105bb360 Florian Eckert 2021-11-09  410  			led->enable = devm_regmap_field_alloc(chip->dev,
004e74105bb360 Florian Eckert 2021-11-09  411  					chip->regmap, kt20xx_c4_enable);
004e74105bb360 Florian Eckert 2021-11-09  412  			break;
004e74105bb360 Florian Eckert 2021-11-09  413  		}
004e74105bb360 Florian Eckert 2021-11-09  414  
004e74105bb360 Florian Eckert 2021-11-09  415  		ret = devm_led_classdev_multicolor_register_ext(&chip->client->dev,
004e74105bb360 Florian Eckert 2021-11-09  416  			&led->mc_cdev,
004e74105bb360 Florian Eckert 2021-11-09  417  			&init_data);
004e74105bb360 Florian Eckert 2021-11-09  418  
004e74105bb360 Florian Eckert 2021-11-09  419  		if (ret) {
004e74105bb360 Florian Eckert 2021-11-09  420  			dev_err(&chip->client->dev, "led register err: %d\n", ret);
004e74105bb360 Florian Eckert 2021-11-09  421  			goto child_out;
004e74105bb360 Florian Eckert 2021-11-09  422  		}
004e74105bb360 Florian Eckert 2021-11-09  423  
004e74105bb360 Florian Eckert 2021-11-09  424  		i++;
004e74105bb360 Florian Eckert 2021-11-09  425  		fwnode_handle_put(child);
004e74105bb360 Florian Eckert 2021-11-09  426  	}
004e74105bb360 Florian Eckert 2021-11-09  427  
004e74105bb360 Florian Eckert 2021-11-09  428  	return 0;
004e74105bb360 Florian Eckert 2021-11-09  429  
004e74105bb360 Florian Eckert 2021-11-09  430  child_out:
004e74105bb360 Florian Eckert 2021-11-09  431  	fwnode_handle_put(child);
004e74105bb360 Florian Eckert 2021-11-09  432  	return ret;
004e74105bb360 Florian Eckert 2021-11-09  433  }
004e74105bb360 Florian Eckert 2021-11-09  434  
004e74105bb360 Florian Eckert 2021-11-09  435  /* Device attribute for color0 register
004e74105bb360 Florian Eckert 2021-11-09  436   *
004e74105bb360 Florian Eckert 2021-11-09  437   * The device attribute colour1 is intended to adjust the colour space.
004e74105bb360 Florian Eckert 2021-11-09  438   * The colour strength can be controlled via the current in 125uA steps.
004e74105bb360 Florian Eckert 2021-11-09  439   * The maximum current for the individual channels is limited to 24mA.
004e74105bb360 Florian Eckert 2021-11-09  440   * To set a new RGB value, 3 values must be passed. This value may not be
004e74105bb360 Florian Eckert 2021-11-09  441   * less than 0 and also not greater than 194. The chip can only process the
004e74105bb360 Florian Eckert 2021-11-09  442   * maximum current of 24mA. This means that any value greater than 194
004e74105bb360 Florian Eckert 2021-11-09  443   * cannot be set.
004e74105bb360 Florian Eckert 2021-11-09  444   */
004e74105bb360 Florian Eckert 2021-11-09  445  static ssize_t current_color0_show(struct device *dev,
004e74105bb360 Florian Eckert 2021-11-09  446  		struct device_attribute *a,
004e74105bb360 Florian Eckert 2021-11-09  447  		char *buf)
004e74105bb360 Florian Eckert 2021-11-09  448  {
004e74105bb360 Florian Eckert 2021-11-09  449  	struct i2c_client *client = to_i2c_client(dev);
004e74105bb360 Florian Eckert 2021-11-09  450  	struct ktd20xx *chip = i2c_get_clientdata(client);
004e74105bb360 Florian Eckert 2021-11-09  451  	unsigned int value;
004e74105bb360 Florian Eckert 2021-11-09  452  	int len = 0;
004e74105bb360 Florian Eckert 2021-11-09  453  
004e74105bb360 Florian Eckert 2021-11-09  454  	mutex_lock(&chip->lock);
004e74105bb360 Florian Eckert 2021-11-09  455  	regmap_read(chip->regmap, KTD20XX_IRED0, &value);
004e74105bb360 Florian Eckert 2021-11-09  456  	len += sprintf(buf + len, "%d", value);
004e74105bb360 Florian Eckert 2021-11-09  457  	len += sprintf(buf + len, " ");
004e74105bb360 Florian Eckert 2021-11-09  458  
004e74105bb360 Florian Eckert 2021-11-09  459  	regmap_read(chip->regmap, KTD20XX_IGRN0, &value);
004e74105bb360 Florian Eckert 2021-11-09  460  	len += sprintf(buf + len, "%d", value);
004e74105bb360 Florian Eckert 2021-11-09  461  	len += sprintf(buf + len, " ");
004e74105bb360 Florian Eckert 2021-11-09  462  
004e74105bb360 Florian Eckert 2021-11-09  463  	regmap_read(chip->regmap, KTD20XX_IBLU0, &value);
004e74105bb360 Florian Eckert 2021-11-09  464  	len += sprintf(buf + len, "%d", value);
004e74105bb360 Florian Eckert 2021-11-09  465  	mutex_unlock(&chip->lock);
004e74105bb360 Florian Eckert 2021-11-09  466  
004e74105bb360 Florian Eckert 2021-11-09  467  	buf[len++] = '\n';
004e74105bb360 Florian Eckert 2021-11-09  468  	return len;
004e74105bb360 Florian Eckert 2021-11-09  469  }
004e74105bb360 Florian Eckert 2021-11-09  470  
004e74105bb360 Florian Eckert 2021-11-09  471  static ssize_t current_color0_store(struct device *dev,
004e74105bb360 Florian Eckert 2021-11-09  472  		struct device_attribute *a,
004e74105bb360 Florian Eckert 2021-11-09  473  		const char *buf, size_t size)
004e74105bb360 Florian Eckert 2021-11-09  474  {
004e74105bb360 Florian Eckert 2021-11-09  475  	struct i2c_client *client = to_i2c_client(dev);
004e74105bb360 Florian Eckert 2021-11-09  476  	struct ktd20xx *chip = i2c_get_clientdata(client);
004e74105bb360 Florian Eckert 2021-11-09  477  	unsigned int value[3];
004e74105bb360 Florian Eckert 2021-11-09  478  	int i;
004e74105bb360 Florian Eckert 2021-11-09  479  	ssize_t ret;
004e74105bb360 Florian Eckert 2021-11-09  480  
004e74105bb360 Florian Eckert 2021-11-09  481  	ret = sscanf(buf, "%u %u %u", &value[0], &value[1], &value[2]);
004e74105bb360 Florian Eckert 2021-11-09  482  	if (ret < 3) {
004e74105bb360 Florian Eckert 2021-11-09  483  		ret = -EINVAL;
004e74105bb360 Florian Eckert 2021-11-09  484  		goto err_out;
004e74105bb360 Florian Eckert 2021-11-09  485  	}
004e74105bb360 Florian Eckert 2021-11-09  486  
004e74105bb360 Florian Eckert 2021-11-09  487  	for (i = 0; i < 3; i++) {
004e74105bb360 Florian Eckert 2021-11-09  488  		if (value[i] > 194) {
004e74105bb360 Florian Eckert 2021-11-09  489  			ret = -EINVAL;
004e74105bb360 Florian Eckert 2021-11-09  490  			goto err_out;
004e74105bb360 Florian Eckert 2021-11-09  491  		}
004e74105bb360 Florian Eckert 2021-11-09 @492  		if (value[i] < 0) {
                                                            ^^^^^^^^^^^^
Impossible

004e74105bb360 Florian Eckert 2021-11-09  493  			ret = -EINVAL;
004e74105bb360 Florian Eckert 2021-11-09  494  			goto err_out;
004e74105bb360 Florian Eckert 2021-11-09  495  		}
004e74105bb360 Florian Eckert 2021-11-09  496  	}
004e74105bb360 Florian Eckert 2021-11-09  497  
004e74105bb360 Florian Eckert 2021-11-09  498  	mutex_lock(&chip->lock);
004e74105bb360 Florian Eckert 2021-11-09  499  	regmap_write(chip->regmap, KTD20XX_IRED0, value[0]);
004e74105bb360 Florian Eckert 2021-11-09  500  	regmap_write(chip->regmap, KTD20XX_IGRN0, value[1]);
004e74105bb360 Florian Eckert 2021-11-09  501  	regmap_write(chip->regmap, KTD20XX_IBLU0, value[2]);
004e74105bb360 Florian Eckert 2021-11-09  502  	mutex_unlock(&chip->lock);
004e74105bb360 Florian Eckert 2021-11-09  503  	return size;
004e74105bb360 Florian Eckert 2021-11-09  504  
004e74105bb360 Florian Eckert 2021-11-09  505  err_out:
004e74105bb360 Florian Eckert 2021-11-09  506  	return ret;
004e74105bb360 Florian Eckert 2021-11-09  507  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

