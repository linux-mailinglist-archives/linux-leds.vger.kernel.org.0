Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F9240AB45
	for <lists+linux-leds@lfdr.de>; Tue, 14 Sep 2021 11:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhINKAR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 06:00:17 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19946 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230282AbhINKAQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 14 Sep 2021 06:00:16 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E9cqEV024470;
        Tue, 14 Sep 2021 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=Wu4bIhAFyJq52pkwiuK2grv3deAKaQcBiyi2/AJrniY=;
 b=P2ZoTaAU2xLBzKL3oUkm4AR833tM3dX3MqRRn35kBL0peejzafU0QmlsVeaXoIczdEDo
 W/MJaEA93w9OWBai0c55Y+T4hNWfnUH0zwhLWw6EnD/LAjI9SNPQ/C8NtkQj0pCPmG+P
 eo4PqjQDBHr834rho5fiv+xJVTPr9Ia3rf9mplHW/ZTOtKJfZiMOYMbdffjgbbyFQAbD
 MzZe389/UShPMEO33fqLU7nwC92oQuoQaqHRRJHSKvK+2SXpn9dP2KMzHhPPxtMUyqd+
 FhCLPpL8WwnTaQtdLgUFFnlN2VYRgQcxmeqUSWP1K1YCzkwRz6RAlaQYiEFAUvART1ok pw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=Wu4bIhAFyJq52pkwiuK2grv3deAKaQcBiyi2/AJrniY=;
 b=sy8t0vUGGwut4oSziWynmtRiN7Gj4/h6ZFbSUFRY2tCvRyEKbSEyojhwziaV2BYz2z6n
 HG/7Puhkqa/ccgbNYWmOhFZSayTnJuO64bnT6BeG7N61XJZ8zBk45jqX0oJC+mo0UhdX
 GFvhcAUHaBCaYD7yXejsTS9a/cF/Ape98n1Kk5V5W/naK8YRIAg8IMe0+BXxJcOVsGp7
 Eai6Ge+hG2p2+Aomut/zLlQ6lHBJ/hAfsQNeacrBN5XnY1qdenrhX3EUbXcsUtDnG1X3
 YB0Vdw8QCtQDxUkixGXbcJYf/FoeMYCpif4LiDliqLCPqOirMcO2NzGSlHo/FMQQZKsr hA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b2pyg8kw3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Sep 2021 09:58:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18E9tTaQ157200;
        Tue, 14 Sep 2021 09:58:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by userp3020.oracle.com with ESMTP id 3b167ru130-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Sep 2021 09:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYQEzX0SvN//W4z6llVt5K6Lt8OwP2Hb5FdgU5VCKZdoRXtQwiNrSehhzB5u27ye14hDhUrRRxBknK+GkQciVZJ9u9Ie4kcGns822ZImJWz+6npgDj44R//h0JSTty/pTIRmWKkqx6HipdLdebMFutmnvQWydXr0keAh3RBbvFNFvqp5M59pe4vX2j33BNuYOPSxRYpzRhGuwgokAKnvEDzGR4dNwCv85rGStDYBDYfUxJrxCUSP5mtBczZuj/wXXMLhwlLX3N0fEVGMvSAW9tP9+hzxjID25IlSVaXCUUjsBUuKFstFx8IE/QIseUz3eNFKiE2CQGc0/kDp8mVL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Wu4bIhAFyJq52pkwiuK2grv3deAKaQcBiyi2/AJrniY=;
 b=SwcBhziCZJfu+rmS6RQuQQ+xbthr/hnjGXis3NQ5lizYyp2V3v2/tw1OOO9cnRfsf4YIaj8AiGN6LCeV0ww+uM2iBE2IqzNuzBKvNwmEEOk62DqZLUg3POKe9d/pMLiavzwBlsRnOwQeiSUadVi3ExL4TP1KFGX9h//zcgw01tuM+l9Fk8scW/GWQ+/pgr/h6prbFhnT6enp/ri+cEWEPna/nwaT0TPAA2COMBjvDnlO+htMOgm8053Pdjf+ZykSlFMHSp+OzXatsmsKDULuZiaAPT/xRwgUm3WJgRjjoQWBfYa0rkNc3uYWj/Xxa4DLj2awbk6JGjIsI5tFinEO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu4bIhAFyJq52pkwiuK2grv3deAKaQcBiyi2/AJrniY=;
 b=gQa241QnXxJMeQ4YB1vPqFNeuF6wzFnMvxkVBDx/02x8TQ4z0KT3caNE+EDQlyFzA5zdxTOuBmOkmpOMvRMLl2SLsEJozIY2tXlCICzM8rBivcC+HJGl02k4FuQASeFCPdnGZ/rRU446OxEKKw6XfzYY1ILUcKxsQvZ6JuPnM+M=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2398.namprd10.prod.outlook.com
 (2603:10b6:301:2f::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 09:58:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 09:58:46 +0000
Date:   Tue, 14 Sep 2021 12:58:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Ian Pilcher <arequipeno@gmail.com>,
        axboe@kernel.dk, pavel@ucw.cz
Cc:     lkp@intel.com, kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org
Subject: Re: [PATCH v2 12/15] leds: trigger: blkdev: Enable unlinking block
 devices from LEDs
Message-ID: <202109121556.LgmETrer-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909222513.2184795-13-arequipeno@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 09:58:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7783a8f-83af-41f2-f38d-08d977663e2b
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2398547EF73345B76D52CA158EDA9@MWHPR1001MB2398.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9a9cEbR6luuUtdPXGCvCYp5ao9lHXKFkqI/9pWYGtOX+pJSz/8GaOahae9K49dG97YyBHpnXL5fqnTUjQGG8BQ4dDpDOklNKopAPwFJdUlb5p1VTuLU5IOIeqe7EMT8iMFtaWiCAlW7QqMqqswx+rBcB/vD8DQnh1v0eg3IaKE2D/ZAhTfwC8GmAayaQ5jtu49XF/tvtS2aIur/ypE4FalC/YPcT71eGbacs9k/zOU/518wKeSGmrTMgrJHVyE4u95CVMJWKYJO1X7s7026cYC+Awp6RXdKRlKY7mJY6ekDMNK9FTYAsgsOhOfd4Khtrjp522bn8oD2XrVVueYFX8KNnQRXwO/5oU6yrcbyPGkXEEXr4Jz+r3Hzwe6lQl0UYtli52wE6pDkS8V+1C3wWw43wRxLckSpDwUXDpOLls/tP7ymm4vEA2IjgdAgAJrN4RF4b7ls5HxYhY+UNFqCyTwIBfT/6i1GuYVcQQ+VYPLQVLiu7bf02LVjEwtWmiQxK+vaIbPaIAG+qi92G/PyJ8LNh58v+iMJWScsrSIIkC1KJXYB8SubYm8myJHGILQoYSdiOWVQXAvhR2NSYQtebi3fbQuWPOOB+ANKK7+DZD1woKQ718tkhlq4aAw6yd52/ZvKC/bdL3KBfqKd2huWA7jzdPrtj17M39FSLDD/PtYugizQYqm3mWdGCsOxb4zeADsy0YGOFCPyggI3if4OffVH19lYnOJ6cIqcvLPidFdcn8ZrOMZ66b/k7fRjn7HWzCJHXozVA3UQZZge/3K3Eini6SgWD7nEtMcu/6odCT9nLhJJMCKDjdo8BoyS5VkDvqEIWVEd0u62LhADirw+YDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(38100700002)(38350700002)(6496006)(6666004)(52116002)(6486002)(5660300002)(36756003)(26005)(66476007)(44832011)(8936002)(8676002)(186003)(83380400001)(956004)(7416002)(316002)(4326008)(478600001)(2906002)(86362001)(66946007)(9686003)(966005)(1076003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bPqoikYGwKypuLLpRBY96SkYKN9xyNJlchm9o5u8yLVzNevEwB+ZPULYbyUo?=
 =?us-ascii?Q?X+tIXd79mS6Zp9fBuzP6kgYrjKpvzwmQsDWwFCrb8nSvbKZP8loDV7vXVICW?=
 =?us-ascii?Q?feasqJWJzku+bSks9kGThM4NFaB8aS8R8FadYEIatEIxIxrOH05g4a0Kn4fO?=
 =?us-ascii?Q?B4cUnbn0lRQuXFGb6NKGkOKYOqOV6hHMTR1rvuiqJqusTQjsxpcH/QqdVX0/?=
 =?us-ascii?Q?CEA4c41/aCe1TnY0n7ZJR4YcUlW9Scb5Dy6ilSVAg5XgPWreUjs+KJqQjRye?=
 =?us-ascii?Q?y2th7E5k87lt1iDT0GyyBGOG7tJ5spI6Y33EEhObIf/dPlCSKxiEIrwZo8NE?=
 =?us-ascii?Q?Xq0z70AZB7BYKGNPbFYMlQ2RDn1e8e6TNV5AePIBcrVjuFhV2AQ8UXWer4yZ?=
 =?us-ascii?Q?eSm5jGEIAmZVvnuq6lpmx5ZPq5D8QLDFE0R1O/w1blYTq8t+c+9+firvXP4B?=
 =?us-ascii?Q?ummg7zv9ZQOtP4tqRCVGqzOxJJINAnYOoVV30mMjVeC3rTOh/1dCY/yq41dt?=
 =?us-ascii?Q?ubES6dRnoyKmLr27hqrFyi6L+KvdjyA0xoJDOLlB6ivRfZsXr+QzH984ogvO?=
 =?us-ascii?Q?H2e4nNCt9TTHQYn2Jnl0L/dBwM4P7q5hdnnmJzfekjvARFr22ridprxOqux0?=
 =?us-ascii?Q?J4E2/qyvmKxLKUPKUc+SF+NG7vnp+yKCyYUBRJeAIGYqZPb+PsQB9uxJmEkk?=
 =?us-ascii?Q?U/eeJHppCX0MjztjV9xjXQ2o5BL92dFjXOaQ0fFqwQNwUcjKIALOHORSPdDa?=
 =?us-ascii?Q?2CZBOLK8JckpzVxlTbTvBXZKQnOxnXv6rr2CcjtDjNeYgeaWKuc3UYLrwNRv?=
 =?us-ascii?Q?BnBtf5FYrbEUQy6GmwRuhswF3sXI4OBtI/Vmoc0RSyLIEv434h1N5GvBSihS?=
 =?us-ascii?Q?yC3S+XvM2F/QWvTUCMgSw4Oj9uVFIU8NXoE3QnO7kWPzURxOhvAJG/pJ2FTV?=
 =?us-ascii?Q?kIiU1BnBj/TH1hHi+ieJFodbbszMBq4meCsY8IaYZ/+BouOP1x5/EJlo0Sxf?=
 =?us-ascii?Q?tBGbDwePk2NLs/ICvLafFNU6ec7/pIKVK4iNrwpT2fGADg3EAiPwWaP6UBVo?=
 =?us-ascii?Q?mGcSwdz2TorgUpREf0Lg4O2sQZT4RBdQErgVFTp7H1K5wgzN2D9mYIKUqrAD?=
 =?us-ascii?Q?tQe1ROZ9dS0JiiB7f93/bw29pHcYaaYKDu5RzWO535gNIF2KXj6bkKoECFoC?=
 =?us-ascii?Q?ihtJ+613gHhg0b0iobaST6lo+XLpPvP0Gas8QXEtFsRur0LhiYf0qK9b4zST?=
 =?us-ascii?Q?4EbNOJavOLolF/bGVHElsgSpzKCLToTJdJNt/gvFDnbIdH4laMfi9lKkoAWF?=
 =?us-ascii?Q?Gaqa337t1ZcwMQ03naWjWLe8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7783a8f-83af-41f2-f38d-08d977663e2b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 09:58:46.5941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVwedYq9PG0km0rjhM4YnRDggH/iHn+3078SddyRGZ2duiOZa9FDgkD2heo9GyhsSR60w4ChSMspFHENPpxBgfs0QKZzc5G0mIu/GB01KwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2398
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10106 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109140060
X-Proofpoint-GUID: PLtDMYWdHNIdApSxC7R8ir9t94OdfNAD
X-Proofpoint-ORIG-GUID: PLtDMYWdHNIdApSxC7R8ir9t94OdfNAD
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Ian,

url:    https://github.com/0day-ci/linux/commits/Ian-Pilcher/Introduce-block-device-LED-trigger/20210910-062756
base:   a3fa7a101dcff93791d1b1bdb3affcad1410c8c1
config: i386-randconfig-m021-20210912 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/trigger/ledtrig-blkdev.c:410 blkdev_disk_unlink_locked() error: dereferencing freed memory 'disk'

vim +/disk +410 drivers/leds/trigger/ledtrig-blkdev.c

66cb682de7e8bd Ian Pilcher 2021-09-09  388  static void blkdev_disk_unlink_locked(struct ledtrig_blkdev_led *const led,
66cb682de7e8bd Ian Pilcher 2021-09-09  389  				      struct ledtrig_blkdev_link *const link,
66cb682de7e8bd Ian Pilcher 2021-09-09  390  				      struct ledtrig_blkdev_disk *const disk)
66cb682de7e8bd Ian Pilcher 2021-09-09  391  {
66cb682de7e8bd Ian Pilcher 2021-09-09  392  	--ledtrig_blkdev_count;
66cb682de7e8bd Ian Pilcher 2021-09-09  393  
66cb682de7e8bd Ian Pilcher 2021-09-09  394  	if (ledtrig_blkdev_count == 0)
66cb682de7e8bd Ian Pilcher 2021-09-09  395  		WARN_ON(!cancel_delayed_work_sync(&ledtrig_blkdev_work));
66cb682de7e8bd Ian Pilcher 2021-09-09  396  
66cb682de7e8bd Ian Pilcher 2021-09-09  397  	sysfs_remove_link(led->dir, disk->gd->disk_name);
66cb682de7e8bd Ian Pilcher 2021-09-09  398  	sysfs_remove_link(disk->dir, led->led_dev->name);
66cb682de7e8bd Ian Pilcher 2021-09-09  399  	kobject_put(disk->dir);
66cb682de7e8bd Ian Pilcher 2021-09-09  400  
66cb682de7e8bd Ian Pilcher 2021-09-09  401  	hlist_del(&link->led_disks_node);
66cb682de7e8bd Ian Pilcher 2021-09-09  402  	hlist_del(&link->disk_leds_node);
66cb682de7e8bd Ian Pilcher 2021-09-09  403  	kfree(link);
66cb682de7e8bd Ian Pilcher 2021-09-09  404  
66cb682de7e8bd Ian Pilcher 2021-09-09  405  	if (hlist_empty(&disk->leds)) {
66cb682de7e8bd Ian Pilcher 2021-09-09  406  		disk->gd->ledtrig = NULL;
66cb682de7e8bd Ian Pilcher 2021-09-09  407  		kfree(disk);
                                                              ^^^^
Freed.

66cb682de7e8bd Ian Pilcher 2021-09-09  408  	}
66cb682de7e8bd Ian Pilcher 2021-09-09  409  
66cb682de7e8bd Ian Pilcher 2021-09-09 @410  	put_disk(disk->gd);
                                                         ^^^^^^^^
Dereference after free.

66cb682de7e8bd Ian Pilcher 2021-09-09  411  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

