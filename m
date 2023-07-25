Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C723760F63
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jul 2023 11:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbjGYJgw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jul 2023 05:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbjGYJgh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jul 2023 05:36:37 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02272699
        for <linux-leds@vger.kernel.org>; Tue, 25 Jul 2023 02:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpyYnJon5+cRpYviUpXMTDZvmVxffOv+qmlJN8KTLnm8Vhio222ney+x81IYSzOThcLF9C2KWnNEiMHimCwccJ3piiIoljWR5WMXRR4S4NMiMuuC36axj7FN7zbaCrvHOXn0j5UQqMcgL7wvDB5yIRR2DxL5sIH6G+dxZAe4Y48SKwwV83htDCCPrzmN1DaqvDgDzFMf6dtzKG/P5nZDhBw6n1pl8bZOHIliqiQglF5VdjMNnW/0GM3heBImWH96qsVqKBL38B6OGIUUAasKNUto4kEFqK3pwp8PBmMaeYDi9jwpT9/NPAHQpap1ZfemVmUKYVxrd5P3PeHmhn6juQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lU04Ggx1iHL/gOzHBKSFEDzl/UORKYDoAvCE+3/TItQ=;
 b=jun74KEQI7DzYgP+096fhUqhI/SO8t4gCkRnxY45Q6V2XdThfY62c83V6YLpi/EVDdbmyRJlzTTiNcUM+UjHeGdQHW2+uDgMm40mld6Mz45ESMhdzIdYadN+U4zQhMJJVIcsoG8NPpXfUErIwfqziuX4SGoR1bksNl8Ocl6Atwwl09YjIoa5ZA52JOX3ZPYev7ROh0PIbxdxEw2oubwTN+YRNMstRlmwcj13mLaQUGYykdjjQYIrJ51qxC3XFk89WxiDIB4uofINjTOI4Ca/dh7hMRbaZeucCmj4N4TtFHy3x8Uy5H5JVgguj7O47HgZ8fBofAD+12rFHrqqp986vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU04Ggx1iHL/gOzHBKSFEDzl/UORKYDoAvCE+3/TItQ=;
 b=r59Bs3IRdo/a+36OrAoQLnqDvEAYOd+xa+dnERqiza2Zgt+0GZ1HVK40W2CwD7Ts/va8DjU1WrjEPznkrLcrkNMZbddnJBiRQJcTBicwqxvJtWSa6o8AznJCw+WWzPvyeKT825HfdWvVRMLb/m1Mno/XC2w0jwyUWz37tGDLdAHLBkDKHqrvQx9UNbjUsk9WL6Q1PSf8Lte5ky/0mU/V0puTz0dIDITPKb5W7O54pvKzvyMSFo02taL/ODtOFTAHLihLT4olLjpUXcfzJ89WAbet35hcmBcVE351tw7laffBA+2bcDEVqY22aBUneQ/0jUTzyf+tvr5ifZirhLJIMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AS2PR10MB6448.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 09:35:09 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e66:8cbf:13f3:c61f]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e66:8cbf:13f3:c61f%3]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 09:35:09 +0000
Date:   Tue, 25 Jul 2023 11:34:58 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "xingtong.wu" <xingtong.wu@siemens.com>
Subject: Re: [GIT PULL] Immutable branch between pdx86 and LED due for the
 v6.6 merge window
Message-ID: <20230725113458.473a0b5e@md1za8fc.ad001.siemens.net>
In-Reply-To: <a22b8d63-ad45-de86-c8b6-3fc53eb3c576@redhat.com>
References: <f16a15a8-aa32-214d-7896-af598e9d5000@redhat.com>
        <20230719145058.5f09c0c2@md1za8fc.ad001.siemens.net>
        <a22b8d63-ad45-de86-c8b6-3fc53eb3c576@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:610:58::40) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|AS2PR10MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a10391-76f1-49b0-ca41-08db8cf26fd5
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GNkN/EuGUYHaaMN6+TqJ969FFw5nLRnxmE+N2Liv7OzgIYwetv48ZoiK7+nGva/UfSDCboYO0JAWyUR3LlTJCPVxJ3UvHs7WskyPxkTZGJ1MnFYRsXEquNUhXtGrthktzKqe8K6nxgd4Z/AsTAr+9KdHeR8pHJ42OWKMb+3SJtg67sFW5HfE6nrQR67QUGmn1Gn/2QrVd6lVk+ArMdo7CkM07l9nwKGwD5moTmNzcmS4+dqSmTzocZ55AUfOx5zJfX1SuiBx3LvO6UQ291BokRH26AP6yOWvPVvNt0DFUG13GHLaSvChnUxBBUFyC57vJZzGmQt/kKFlmVZGWIQ8o6OPT8w0YVAVZXZjfuqzpoLAfzxRBTGs4UCYqHuybwnhRy59epskCzXUft5UgefKtrm73eYak8YfjKi8vz0At3M3yMMNVzZc2iAd9glBMFnFuf8T4PVuScnSQDPdjv5fe7+ZYrwNzZZvpV5qO3FjnaCsGHhvJZwht7jLs5zSKXzW/JIsCvGofCM3hm91zMe8t/W6uuBRlg/Ipv9mnYLAGJE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(107886003)(53546011)(86362001)(478600001)(5660300002)(41300700001)(8936002)(44832011)(8676002)(54906003)(316002)(4326008)(6916009)(9686003)(6666004)(6512007)(6486002)(966005)(66946007)(66476007)(66556008)(6506007)(186003)(1076003)(82960400001)(38100700002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jtkPZkSNZGSfRFy8G5bFn7tSS1lxXPFDD46mPIrFNZPDj3rTFtEFEdFgqAaK?=
 =?us-ascii?Q?zXEqiqDy9FVAcl7/I86xuFUYTyCC1X3RO1H7z1X4N4qg3pksdFl17H84fZ1A?=
 =?us-ascii?Q?tKcZvTFKyrZlFEFBocHAMJzmn8c1VTQGXVp+E+AUlKOOzf0e4C/waIzny07c?=
 =?us-ascii?Q?cs2IOKwZFvgyA1oSythfIwm3Zy2Kry0jgIV62wMFJ5bg+TdWHbMgh4jz6O39?=
 =?us-ascii?Q?zwm1bZP9Ve2peTBA0Nw/D4vqygZ9reN53gvcx4Wi2Lu9FwmwuinP7u4X0rwu?=
 =?us-ascii?Q?PsgS6fyWZeR8rG56OS1xdtyrmkFimye2h0klevRPXSYB6gRFIPKRiZdbwPcG?=
 =?us-ascii?Q?7xINELJggX/yxbC6CS9nKgU4/aNGkP1QzWaayuz4A5UvEcNkElMFzTJbdNfX?=
 =?us-ascii?Q?Vrp53Y9Pv/QI6OW4L92veMVKBqBgtyS7zJhzwxq7hnE1Uih3x3QMX3Hfaxfu?=
 =?us-ascii?Q?qysHLneBt37AjV1ZuoeDUrGR2vTMgFxl95vKQfy3R2XseJfv6HwRDw/kP7kp?=
 =?us-ascii?Q?xk/zbKmqv5wwdaSuXVdb04vVKkRgX3OnnJcVgbEeFuZaXevUPUIwLe5S+b1g?=
 =?us-ascii?Q?bPJF02SxX5ijGUbfsmTONxxJ7NpaoAtP3ifVi4wIjJY5d8WeNDmc4aIEHzHJ?=
 =?us-ascii?Q?n9DNA7o8xIKwdc5fi/e27aE2XLDU2eHH/SeomR2WQUYBZxtsOvdZhtbA06Cr?=
 =?us-ascii?Q?XOlnHNnzEZZL/POFzShRb88AEaK02JM39MM8vMS16QgGUR8nptqdVGl/3sPL?=
 =?us-ascii?Q?IAPzQM2wcTLrTRMshR5FoCNvU3O+wbh+61s4wvQrOQxtUYD1XZ854qQqz4pI?=
 =?us-ascii?Q?lsM1BYk++kKiT2FxoyyegCmo4EqOFt9gg9D6gwBrZJ381cKRcM912rNdJhpg?=
 =?us-ascii?Q?xG3neeG10PNcEki3Qu9t/846Z2XE/g8QhHAG75aCPSg9ihzzCVoWk3BIXbcT?=
 =?us-ascii?Q?/BKWoUSJud9qy1V7nsLTnzJ5F1KLdYf52cL56PGV4MHlcsU0PGecEtKTlW3D?=
 =?us-ascii?Q?dKu2iK7E9361WtinpTAsyCVpY1hjbLtQD07+vH61Dxp7PsigzkMEDGXLh/GN?=
 =?us-ascii?Q?4hh2drvdZ/7JPGFADEkqEq749hMfn0TXhBjZrgL1+14AP7f9IjBybuzgxg6B?=
 =?us-ascii?Q?S0V8EivzOr5pj8MuAmQ+8kw4UgfCM9k7tqKuesgclUnFHG94wYyvxKW7mDmH?=
 =?us-ascii?Q?6ealAyveXynUFwjvdJhuWiSifu1/zsk61G6/+TXO01we+ZE8Q0dXpGaTS3D+?=
 =?us-ascii?Q?hbqzSjgs7eD+XjguIzC8iF+hEqZ7ET2WX9hsOy0Q36sx3Puuq/vZN7rkguOd?=
 =?us-ascii?Q?+0a3LT2DVrF+w/nBcFbVyxA6KlvAonI0PmRzf56NqthLnmsV9fu2C9/Xmktq?=
 =?us-ascii?Q?IQEZbuJitkndWaCaNZMRPqvf9QBTRFGkykwQm4W5kRIY1TnQzot6QVoopnyg?=
 =?us-ascii?Q?hU/vPMR5KLNekCt6t4e60XxzmOdqwZW7mBjD1vuzyQ8vqzOrXBVgOukFFIvd?=
 =?us-ascii?Q?iySHB7APw1JCNguyQfkmvoCsF3/p/mpMSdLg/JSMHfKVkgULYmggL/C0eAW1?=
 =?us-ascii?Q?K8ieZxOA2Y1I+r/488qQs7qz9spnUGVxweNxEay8kNGWehHCEktgetMmSXaw?=
 =?us-ascii?Q?A26E5pC9qYxUI47/Lq/Orn/pJGlWrV7X1S7+LRS26t2SfbLF2yfgp1IvrIun?=
 =?us-ascii?Q?TBQFJg=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a10391-76f1-49b0-ca41-08db8cf26fd5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 09:35:09.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFw18+ge1CF8A/PQDh3uR3E1pPY8KASoTi2dexh2vD0Z1o8EcSO6HFiaSSKaZgarrJG5geBcbKD1ucPquBHwqx0xJK6fGvg/7Z9YDjaxaic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6448
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Am Tue, 25 Jul 2023 10:26:33 +0200
schrieb Hans de Goede <hdegoede@redhat.com>:

> Hi Henning,
> 
> On 7/19/23 14:50, Henning Schild wrote:
> > Hi Hans,
> > 
> > i actually do have a bug-fix commit on top of that, with a
> > 
> > Fixes: 917f54340794 ("platform/x86: simatic-ipc: add CMOS battery
> > monitoring")
> > 
> > one IPC model had a small issue left with reading out the battery
> > state.
> > 
> > How should i proceed with that? Send that fix on top or make a v2 of
> > the CMOS battery patch after all? And if i send on top, can i assume
> > that the current sha will also be "immutable" when Linus takes it?
> > That last question goes into the direction of using "Fixes:", which
> > might not be needed/wanted anyhow because no backporting would ever
> > be needed if the fix gets in together with the patch bringing the
> > bug.  
> 
> Since I've already send a pull-req (created an immutable branch
> for other maintainers to merge) please send a follow-up patch with
> just the fix.
> 
> The whole concept of an immutable branch is that it will not
> change, so we cannot change the branch to squash in the fix.

Ok, i just sent those two fixes and actually based them onto the
patches creating the subdirectory you requested.
And i went for "Fixes:" because to me it seems that the SHA i see today
will also end up in master eventually.

Henning

> Regards,
> 
> Habs
> 
> 
> 
> > 
> > Am Fri, 14 Jul 2023 15:21:12 +0200
> > schrieb Hans de Goede <hdegoede@redhat.com>:
> >   
> >> Hi Lee, Guenter,
> >>
> >> Here is a pull-request for some pending pdx86 simatic-ipc changes
> >> which are a pre-requisite for merging the follow LED patch:
> >>
> >> https://lore.kernel.org/linux-leds/20230713115639.16419-3-henning.schild@siemens.com/
> >>
> >> (Guenter this also includes the watchdog change you acked for
> >> merging through the pdx86 tree in case you want to merge this into
> >> the wd tree)
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >> The following changes since commit
> >> 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> >>
> >>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> >> tags/ib-pdx86-simatic-v6.6
> >>
> >> for you to fetch changes up to
> >> 8766addf665e9f0ace15cca894ba225e5a4d580a:
> >>
> >>   platform/x86: simatic-ipc: use extra module loading for watchdog
> >> (2023-07-14 15:06:40 +0200)
> >>
> >> ----------------------------------------------------------------
> >> Immutable branch between pdx86 simatic branch and LED due for the
> >> v6.6 merge window
> >>
> >> v6.5-rc1 + recent pdx86 simatic-ipc patches for
> >> merging into the LED subsystem for v6.6.
> >>
> >> ----------------------------------------------------------------
> >> Henning Schild (7):
> >>       platform/x86: simatic-ipc: add another model BX-21A
> >>       watchdog: simatic-ipc-wdt: make IO region access of one model
> >> muxed platform/x86: simatic-ipc: add CMOS battery monitoring
> >>       platform/x86: simatic-ipc: drop PCI runtime depends and
> >> header platform/x86: simatic-ipc: add another model
> >>       platform/x86: simatic-ipc: add auto-loading of hwmon modules
> >>       platform/x86: simatic-ipc: use extra module loading for
> >> watchdog
> >>
> >>  drivers/platform/x86/Kconfig                       |  49 +++-
> >>  drivers/platform/x86/Makefile                      |   6 +-
> >>  drivers/platform/x86/simatic-ipc-batt-apollolake.c |  51 +++++
> >>  .../platform/x86/simatic-ipc-batt-elkhartlake.c    |  51 +++++
> >>  drivers/platform/x86/simatic-ipc-batt-f7188x.c     |  70 ++++++
> >>  drivers/platform/x86/simatic-ipc-batt.c            | 252
> >> +++++++++++++++++++++ drivers/platform/x86/simatic-ipc-batt.h
> >>    |  20 ++ drivers/platform/x86/simatic-ipc.c                 |
> >> 119 ++++++++-- drivers/watchdog/simatic-ipc-wdt.c
> >> |   9 +- include/linux/platform_data/x86/simatic-ipc-base.h |   4
> >> +- include/linux/platform_data/x86/simatic-ipc.h      |   4 +-
> >>  11 files changed, 607 insertions(+), 28 deletions(-)
> >>  create mode 100644
> >> drivers/platform/x86/simatic-ipc-batt-apollolake.c create mode
> >> 100644 drivers/platform/x86/simatic-ipc-batt-elkhartlake.c create
> >> mode 100644 drivers/platform/x86/simatic-ipc-batt-f7188x.c create
> >> mode 100644 drivers/platform/x86/simatic-ipc-batt.c create mode
> >> 100644 drivers/platform/x86/simatic-ipc-batt.h
> >>  
> >   
> 

