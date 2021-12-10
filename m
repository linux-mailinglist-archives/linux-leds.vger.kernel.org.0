Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3560347021F
	for <lists+linux-leds@lfdr.de>; Fri, 10 Dec 2021 14:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbhLJN4k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Dec 2021 08:56:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29228 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230296AbhLJN4j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 10 Dec 2021 08:56:39 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BACxLk0007054;
        Fri, 10 Dec 2021 13:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=FBYC8bhIZBKZl0CxUIuBz7Dq+WXyZnu0RnSo48kPcZg=;
 b=nihX9LZJ7ooWKDzhzHeed8uO/7qEOCV17TxFAjz7mRb3p7O0ZOFg92pq/PexIRsjbXFv
 Qdy+a4+F2Rz+7O8PVpJwy0PO6t/l3rCG6oLyZr70WPqzTi43SedqWAGQ4c8k76g2v+yg
 zgCD/qpNm79MJIXs7elNZCPZpr7mbHkpon6N3p/KET6mZpZMbrhVuMDw66HCoUdyqF+E
 O5byfa4v6+JMispGdAMge0tSFxNepHvpvvtogEh0vMj2KncFuZxmFdK/o+SiXl7NLsl4
 BhYyj2ScT2i8K+5XjMVhkW586NprcI8X7D3XW5/coZu5ORhEHgqKhIBcB3sZyEfJTPMO oA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ctua7nr1e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 13:53:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BADkGWo175940;
        Fri, 10 Dec 2021 13:53:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
        by aserp3020.oracle.com with ESMTP id 3cr059anb3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 13:53:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5jqIZGHMlJbbC1AHkfVR9dpgGOV94C4ep1X8C9+rnd9eu/s9rJjcupmJLSFPoTqm0MA/gD9ri5Vq45g6JWZ6sj6GIAbplYiP/NaojtBHSF/YBatXprRmpFNdcaHyLhTRPa4msserMZ6bXI05e4dpewMbf5PTLxp8/J3l6mLaaQy9k8c3FXRXBZcgtZnTXYSqIIRPbYwJkxW75Tj9rlSi7BIO21cFMkB0tyDO/qFToKrRV0X0UhsQS6c38Ln1NtBbpRa5n8c2mDrtIjxD85V0MNEpaOT0olI9DbGjZbRBY2u1Br+nt1SQkE/RaNAmXNv+2tPoErSYleiQv+K18QDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBYC8bhIZBKZl0CxUIuBz7Dq+WXyZnu0RnSo48kPcZg=;
 b=F+v0+0nxq1fU5leO+lsesQG8TExgecrBKlSgkPJVbLYjiWv0Kdys15O0hU6VlC80Dwhp4EkzR18p5S9OgrEzQv12x97q7S1INxXhqZD7VJaRXhvA3whjbtfIiXtaHtSD2w2J5IuyOKekjXDgm7l23+CW9hrO2taAZAEIgcC6m5PCUaGgoESlMM+VuGczjZHrUadEadWzsT5TGH7pXICXbIuqiAHybiHvOGsn9oAGxbwRsVQlohFUrugYETu8h1CsQFFJQiX9t1d0SJYBVF6eUMP3TqNG/q5PbMGWj8ZoKd4CT7ovI1gRoaHNTuKDLSlimaAy8j8rVeBbtcAmtXHlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBYC8bhIZBKZl0CxUIuBz7Dq+WXyZnu0RnSo48kPcZg=;
 b=KeRCmrs9I/YrOUWGhZkSz7mLstgQ/R4FUgy3qUz41XnVuQ+E27GUzPcd0X+EQWcWtwTkKq0rVfdEUqO/mwxalks1jGcC0RP2TcDtyuUrtbvE/sMmFMn5KtGAvqRKebyFertADsZbPZPqOPTYYzXKtt0DwDmXHboX/GrXfYp8vJ8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2159.namprd10.prod.outlook.com
 (2603:10b6:301:2c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 13:52:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 13:52:59 +0000
Date:   Fri, 10 Dec 2021 16:52:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-leds@vger.kernel.org
Cc:     j.anaszewski@samsung.com
Subject: [bug report] leds: ns2: Remove work queue
Message-ID: <20211210135249.GA16777@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0033.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0033.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend Transport; Fri, 10 Dec 2021 13:52:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 108e7c60-584a-4cc9-7424-08d9bbe4605f
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2159:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB21591A3AE5E4009AAD66EF558E719@MWHPR1001MB2159.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UfXxKcMay7fxLMa/FagvJyU/Db52WYun7CR9zORhCWlKvEN8/jKQ4HrXlX3ZBhtK6qCrsXvzjzrdkGy/kSRgM3wx7fVjZ750lsVk0ADL328J3ax/omD3AA46rELWenCQJVYgcPtUEXeEUYEAOFGJMA+4bjoBiD7f/CNk5lJy6EtFPlFKRs0GAve4hbswcDt9pMpLHBUAj6Sn3K4v6abAqqhXA5/a7GX4Ob+DKTKVoK6indJJEbFJ6c9X1VpITqmyl0e3MMedx2V+CZytqiQoejKslpmvIRMx5jdwbcHf279tbDFYyO5c4qE9Fc/czjZc3ExVi85xAnZMmEM3wTU4LCR4aVOKaFJaF5yEFGSrtQ9aR3EuyP4m9ORgguhn97cnuqv1czF0f83XZcXGD/1jKsn64jlEJwJVUFfQts1CPMqxP335YUzCVh+FaHPJFwz0sfX5itjVBAGTUWp5+iajLnAuwY96HAMircY2bCA6V8N5jMRLvigBKDBOAktmqXeZAhbsURS4m3/1HEaX+4YfGzS8rKuTM/lFp5zVwBYpNAHK4Xc+aWRx6wtKtpKej0RoS/AjQz3dguFTKUwYzDsXiyIafgaVvzvZiagXF3l+6oGVeEzDWj+0fVo6JeSytXuNOBMJfWG9xy8h0/+224RoonUt/ENoM9k83a5VvffkbIx4/pLDjq2resiTRbTqTH8MWKr9+94R01kVwTKO3hVK6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(6916009)(316002)(5660300002)(1076003)(83380400001)(6666004)(33716001)(66556008)(6496006)(33656002)(186003)(38100700002)(2906002)(66946007)(4326008)(26005)(8936002)(86362001)(8676002)(9686003)(52116002)(956004)(38350700002)(66476007)(44832011)(9576002)(55016003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PiKmt0WmkNmPuqypP5bpRl6W7nX4h/i3JJz03+4jgmmT75ZrpsxQ+bTFzum8?=
 =?us-ascii?Q?EGU+uwUfmk6oeWjuRbL15ZWe7tf7MBeEyNAQm+fwdaZ4EgvUYSAqw/BHDTCm?=
 =?us-ascii?Q?PXLmff26Po8/B5PB+npZyDUE3/uUquzG6eph+QSSo8Yl8AU8xW7RpSWDoR/h?=
 =?us-ascii?Q?JbKj+bItFCDpwW9ReuFbaw5WkpM05btQ4g4oY5Kp56Px0kGdxSwcwaKRCZpO?=
 =?us-ascii?Q?STEiTSurwoYU0dMl+Ra9EsO0JIGrWRX3Frtxjkrze4mvorR/h2NcChqkcqvo?=
 =?us-ascii?Q?R64oK9biNSStfX93UuX3QTWuL3EO99Qmkba1xiFy2yfzt6l38zEqFLqAXwfr?=
 =?us-ascii?Q?VrGW+2oroyv5YmaMms5uxkv+N95srOZYkIcGj7UNfQMgtkCyhS17+JzUFi3a?=
 =?us-ascii?Q?sVyaDp13QlCeCkEiqnMGKMw9UvUauQsrPWvGRVr8XGVS98S5CQ9pqNGgtFj6?=
 =?us-ascii?Q?tlXJA1KWUFVQhaFCX5i8aJPd2oewthFxRHSlwalzbxMIpbFJR/MVYIPyf11q?=
 =?us-ascii?Q?5elXuh390jPrBTP4TlO754Vph0Oxj3lWo2ObAGPgZ+1rwvZs7OwORHSIYYlP?=
 =?us-ascii?Q?qLh8wUNJResQ+2i2scbQZKskDZ9dVG+dX9EhSRtbWSyLYSxFB3g2cgJ7J/yU?=
 =?us-ascii?Q?vtd8VJBt1Eipt3fnOA1RGBrnkJBrt+ItC8SG2mILNbnZh5LotWIy+ZWZNYXU?=
 =?us-ascii?Q?cUjcYzZ647k3aLOhcswAEuDAx0vheeJhWRlcLjvzNSZ89+R+g9yh9ux/arvK?=
 =?us-ascii?Q?Yyz6punCQ4YnuMJhZMLH/7cFIpFDcPP4fTJvIZA8p6JFIxW12NVbnNeAfd5I?=
 =?us-ascii?Q?L14+TYWbrbWhHNtZ61ZPgia7i2Uv88r+4ayJLu5NNaG1ro3AJ2FPVXj0YtWJ?=
 =?us-ascii?Q?V71U6VPY3COnC09NOGHEzOEcKUrZNU7B9EIVPdkp15V4wittJ9ike+cKhvl/?=
 =?us-ascii?Q?bw03qbQ2UeNX8cJgnyzByO/j6IJmTlw7jWif/gFfbVE9Qpn46Kt70aLg0XBG?=
 =?us-ascii?Q?e5FoNUr6T7ixa9XTq3vpL57wR2TJ/2SvfuBhNw7BNAeO5uLEfhfT3LGTZNmM?=
 =?us-ascii?Q?dyW0ktLhYSmI/EYNEWQXfjMavcPisTpxV/gW472xrYYU6B5goXd5YUV+Zvhp?=
 =?us-ascii?Q?wElFlTx2TkMpQBOoLrW24Xg2i5cOw+8p1ppJUIPeLa7JzJjV+OBcHZdXS3Wc?=
 =?us-ascii?Q?88MZYYJX3oMYoWD2GHADQyIbufBV6cwioBH9bZcSY6YZtbTVdfsK0nDUKYbN?=
 =?us-ascii?Q?ZdjEzZj9L0mYr0Yv3IF3SlHzovOiYBeRhxOEoPrhjy5vzzRw5zwZkz5PMNnm?=
 =?us-ascii?Q?MvFBivVowTVOvlnlWv8pMpVZFGLVyVaCp1Y53mS+CYYYNUtyB56Zl7adtOFU?=
 =?us-ascii?Q?L9Rxa7v0PHHwJRM2RJwhWvR3xRzmAMipfMVz4fj6HhydtM5x8gsSTY5dU0+c?=
 =?us-ascii?Q?i/FM2DnbLxGFPetgMd8bbfsamIkow8ukvL1Z7Qbcg16h2OStRDyrFDErTvhH?=
 =?us-ascii?Q?fmnJZynfFtBhrWPJdYoqISB7DUPkgjcaczjjlh5navT3coLIXe+FggLHyFmv?=
 =?us-ascii?Q?fC8ECocOrs9J9u0nwy7HFI8ggJ/jxcNmUiyM3x9OTsw3Fgfo1plvksu5x81w?=
 =?us-ascii?Q?R3RPdnI8q06GfJgLWgMASl/Zge20trJ/HftsJKCjzrnDhSOq1umn+Vt27y3Z?=
 =?us-ascii?Q?7Tw3rVEAgKpgAoBC5Mb3T/gkNVI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 108e7c60-584a-4cc9-7424-08d9bbe4605f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:52:59.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1Z0Eg+2BYK+4OIASR4LQztPPBAJ7goxctzcWY7wxPVUooDvKfWGaNjSLiUD7wXeQM3kep8xR27Gr6GCZqBoSVsDtRjDKsOpwGMSUYG4IrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2159
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=548 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112100079
X-Proofpoint-ORIG-GUID: JWxzh65bM7I63JItGfvvHDUphbaa6cN7
X-Proofpoint-GUID: JWxzh65bM7I63JItGfvvHDUphbaa6cN7
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello LED devs,

The patch c29e650b3af2: "leds: ns2: Remove work queue" from Nov 20,
2015, leads to the following Smatch static checker warning:

	drivers/leds/leds-ns2.c:96 ns2_led_set_mode()
	warn: sleeping in atomic context

drivers/leds/leds-ns2.c
    76 static void ns2_led_set_mode(struct ns2_led *led, enum ns2_led_modes mode)
    77 {
    78         int i;
    79         unsigned long flags;
    80 
    81         for (i = 0; i < led->num_modes; i++)
    82                 if (mode == led->modval[i].mode)
    83                         break;
    84 
    85         if (i == led->num_modes)
    86                 return;
    87 
    88         write_lock_irqsave(&led->rw_lock, flags);
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Holding a write lock (spin lock).

    89 
    90         if (!led->can_sleep) {
                    ^^^^^^^^^^^^^^^
Even if the led->can_sleep flag is set, we are not actually allowed to
sleep when the preempt count is non-zero.  Presumably we should make
this unconditional.

    91                 gpiod_set_value(led->cmd, led->modval[i].cmd_level);
    92                 gpiod_set_value(led->slow, led->modval[i].slow_level);
    93                 goto exit_unlock;
    94         }
    95 
--> 96         gpiod_set_value_cansleep(led->cmd, led->modval[i].cmd_level);
    97         gpiod_set_value_cansleep(led->slow, led->modval[i].slow_level);
               ^^^^^^^^^^^^^^^^^^^^^^^^^
These functions can sleep.

    98 
    99 exit_unlock:
    100         write_unlock_irqrestore(&led->rw_lock, flags);
    101 }

regards,
dan carpenter
