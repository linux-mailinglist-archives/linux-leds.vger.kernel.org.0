Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99D649FCC1
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jan 2022 16:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349314AbiA1P0f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jan 2022 10:26:35 -0500
Received: from mail-am6eur05on2063.outbound.protection.outlook.com ([40.107.22.63]:22423
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245268AbiA1P0e (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 Jan 2022 10:26:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRK6di+hOdikTO1aV8cFvz5Lo6sJW9s2CadMbTmpZeAcGGHzHBaklIer4xHCYbsqC1fEzrYpgeFcMseUCkaep0+WrHmJ7J173okqvY0Vw+wSE/ygNSM/6qVe6ldfiSvsrISSmkK5/Kvy43/m75aJpxgNFInKBZIjYL/uQfUfqlQjIQNGrHk1Y0geCM2WgSVo5QLwu5n37ReUsi095XNYtN39/oahqJ+4pdbtHRaDVOpXNk99W32BI4b1IsGdewcjEj9HGGPj4EMVNuYhYg88ZbJGueIL8UiULiObAgCeUZK9B4ozns9GLlaU7ibyaCEkzk+psw9GIDTZIdrEmWTKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5K+m1go1tjtmyPwRsTQxi1Z4ucHTYJL4ytrrw+39TQ=;
 b=R4QqkMMYq3fowJBlsILDm8AFuWFPQVYst34NGtqYW1NdpCUdamnRB8gCZsuocLB0IXN8Dbs/2nOvHQlUSz7nEqkmAXbh3uKYgNyO6kXmioHZzzxPQYuBDDQPNIwEdbvo+rQDw3Ax7bFkieolUl1F8mcQkZ+5Rb7XaTsPIOhHflbKmft9xLNUdHyGin1GozTpTBlDQu+zjz7/bG6eesla21BkOLrWXf43tofhpRlZx04ZKex5TyRo4vDMz7eQySCPM5Wh0Dzhc8DylMltw9OzUDRwk2ijgoDDvnALM7n5Nu0ExfitSufwy+WAPzSBEAu+3EyZhoSC3HqefIZNMigPaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5K+m1go1tjtmyPwRsTQxi1Z4ucHTYJL4ytrrw+39TQ=;
 b=LMZ1uSaGT8rninrF0zUYv1mXj3i65tO8fl+Mkfg5W5MILrD8aj3U29ZnQZhX1IRzSL6C9QXpKMaPu1pl8hrdojsCgslVzShNQrzF1ezW4KJxlDoheVWP5xBI4YQ4/9KQ6IDKFm4L14VfFfQoYmeDIDu/0IVdDAXYNAfvWJIRqixdNKS7dZuIVIUpebMJs64fLaaa2gmm8o4EKeVupJXM16JP9n/FNsdQ3uZxieM/WNGjLunoeLvIFFUCM3aL3Q9nnJzWU43ioGZ93uruJq9SYr6G8EOem7VnQ5WobcvXdhY9Ylpp1Xf3ALL3R/aNqZV63yGEd8AsTOZzz5JjxBGqlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::20)
 by PR3PR10MB4205.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 15:26:32 +0000
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95cb:ffb4:beca:fac0]) by AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95cb:ffb4:beca:fac0%3]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 15:26:32 +0000
Date:   Fri, 28 Jan 2022 16:26:29 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     gerd.haeussler.ext@siemens.com, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] leds: simatic-ipc-leds: Don't directly deref
 ioremap_resource() returned ptr
Message-ID: <20220128162629.27cf98ee@md1za8fc.ad001.siemens.net>
In-Reply-To: <a6c629fa-1b47-803d-9f16-a0d1df70dda9@redhat.com>
References: <20220117112109.215695-1-hdegoede@redhat.com>
        <20220117112109.215695-2-hdegoede@redhat.com>
        <20220128102907.2bf438e2@md1za8fc.ad001.siemens.net>
        <a6c629fa-1b47-803d-9f16-a0d1df70dda9@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0024.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::34) To AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:155::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be6423fe-5777-4452-d9a7-08d9e2729024
X-MS-TrafficTypeDiagnostic: PR3PR10MB4205:EE_
X-Microsoft-Antispam-PRVS: <PR3PR10MB420585414A9BE65CB9B4A28485229@PR3PR10MB4205.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8V1IUt4u5JaXVJDWW5JpG/LV1SlqUQSXVukOwGy51CPlzaRob/n7kkSkch0+ZLgL8lKZuXRGNP4XB/jYv7HIfGuBW6W8uNC6FwluvNsirXo34Ktrm46SJRQ/YM9KMnPlhFided8r0c6k92Zi4N6Oq785Byfy77qGucV73BQsPT2hCbPJu0Q3xEkXFvqC00H3ECjuvLoxmLXQ3NBq0UcxjPZmi9dKv4hfBZ4gyXcsGMPV19dbwN1Cun2sRSSKht8m25FABlXr5cIexN4O5r0SCDqjNdpLIuBRDCM4gwJvQBALEV2Jy9GC5o+5+xzTPR4kt7CQKr4tKec2GdpN7aVHJcbJf/3uqXDjsvdDrkHIleeP6sRm4Xd+zitn+wrqsRwuSaKHvLZ/pV1eBMXbpG8SRptkmN7Wpws3CEEpr0mGHZ5nshLNZnvGW38i3hj2jEaQ5CdVoh0/z7S1JUtvb+7XY4+p0JtAFGFuP87kWsAULhmmjwjuMbbigcmuEfGONLVcrLJH/10OxWf9i3yiIrsAdjg114ovxWKMU3MmwDiN4y/wZMYF7A/xkRBqTWyyAkCFtqeugW+/QFE199Bj9yLFe7r9e3ZI+AuXJetYLfBzhGK0glYPhH0GpYPm0pZVtXkYGrwY4uIRjv7754Q9wWMsRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(66946007)(2906002)(5660300002)(44832011)(66556008)(4326008)(8676002)(8936002)(38100700002)(66476007)(82960400001)(316002)(83380400001)(9686003)(186003)(53546011)(6506007)(6666004)(508600001)(6512007)(1076003)(6486002)(6916009)(54906003)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/kndBg5fp3d+CYzDJw+WZaFvhc3wBDfD85nR6YMpVgLQpwJX6v7CdNnYM75h?=
 =?us-ascii?Q?hIArg+DuPH6EIcWgho1V4OagMo5T2+N5zHDGjttk3YWwRBUWESmgOi/2vPVC?=
 =?us-ascii?Q?unr4TBU92zy1LJn5H2cM6DI5+OH+VyQ+uuu5FmibxpQVjO7i6JSLAGfYmLdP?=
 =?us-ascii?Q?Fcjz6zF8X9PRn6KE8la8pSNnm1j1hkpj9azpwKFFk3kdhADbxVNKbQH3e4ua?=
 =?us-ascii?Q?iRgZ6qgS7KKVbI8/3ECiXqehNTD49iSh31aNjbr3LYkXZe/V7jnp4i56w3oL?=
 =?us-ascii?Q?9ZoSjA4VV3m3bi40Vi+iUW+vcUGGMnlflMSLmkKTR6q4Ah7TPH1vSXrGR53G?=
 =?us-ascii?Q?l8TAk6npdXlOI1Bo6PZrlfEALzYtp+shzCgTg/kmPnGJnK7xHtHzKj3pofsl?=
 =?us-ascii?Q?fRwtIgfZSnHsq1Q+rexb7N4am26JLTIWEr7L7PvdbBvD4Nlo5rQwi59y+JQJ?=
 =?us-ascii?Q?hfIHijuvdcgKbjvTOvVxJaecH3R0MFZJ1gm9JRr6lI50Cuni8YK5EksjA3hy?=
 =?us-ascii?Q?mfapC31SlgF4GbeJvrdICucxp8MdF1T5Ao83bFY7nwhB8DBamOaNUjynXOtF?=
 =?us-ascii?Q?6C9hE5gCQ2mnDvLuXf1sLksmG5a0P5VGZVl6wwCymmHFfCOR3w7pWA//3Arg?=
 =?us-ascii?Q?e8GwCdZk+SLP2WT/w4GHYq4DYCGkBS+CDz68h/eiz5VXYIytQ7+GaplUEjzv?=
 =?us-ascii?Q?eHukZmP8wWtGAZ2uqgdos4YHYoEtJXGH4dmVgzg6yXdz9bMmr6A9bvIjP9Y0?=
 =?us-ascii?Q?Xt+cH7AHNMGFTML7vaAwLIOg/wLQhgj0gsv8b9tMRxhgDuJJUm2I9kCiIQ6K?=
 =?us-ascii?Q?eTkfGHHxp5ssPFWMaHqBRhlvhWfiAiW8oXSs3D4YOFwKRGkFGyXj9faJDeqC?=
 =?us-ascii?Q?7cw+8dgkblv2s6YII2ZTN4jkQo68ninro1MnPoY5Nk7KgGoSVd14XePjkxVE?=
 =?us-ascii?Q?HEXc9QrLKePbcQlKYx7+DLPKiTGrBegZcmsl1be2KwJFiu1cssUv96dsRboH?=
 =?us-ascii?Q?OsK2669doT9ftNmsWjmnF7+RWknwqFZX7hECx/Sl8rO5g1s3IqnsljxmpmYi?=
 =?us-ascii?Q?XzlTCvyCXMnv/mEZhFAYGq+3I1a5PW3HH0iwdjOS/wEF6Yt49MtthlpZjw3l?=
 =?us-ascii?Q?cAQpY+XheyJQ+CaHOljd2Gh6wZN8s73OzQrkiE2pndl+T3n46rZlCgOu4gZ7?=
 =?us-ascii?Q?07Qcb77PysaiJn5/hD8DE2H5D3qgXr8ywCEGyFAWFWZl6YUCac2BOcUqqN0I?=
 =?us-ascii?Q?DSHKCvVWYPREo5e49Tz5i/WSXsp2wklYbpZE+86sR8AiAq9kKCGbBgZlTLkI?=
 =?us-ascii?Q?aImA3dSjFqyfqmOK1JsLs3K7dUS4lgy7c+2Lw3U5tTxD//IMLRa9ij8/OK8O?=
 =?us-ascii?Q?bwlqMp0A6p/X6YndcD3OWPHtLo35pcUAXaSiceX54xmBOIbjqrrKjEzxOX3N?=
 =?us-ascii?Q?GCMV4j4XOuNg/PisYbUwyUm4vW/IRRzHN4Jcm4X/s1KKpUTvGIP8Lymq8UKi?=
 =?us-ascii?Q?vGnQgKumMv/VeI9ncX2ojMrARiTUyVxSkERzAYS1KfWeBR22tPIEoiJDCx/Y?=
 =?us-ascii?Q?E34CMBWHXIYqDacyaoEIo4en3q89XseRN+i0dCEv63bW1vW2dvWfYTIgEdxW?=
 =?us-ascii?Q?jkYSd6KZdX6wgHnxg/Nu/DgaAuDlIYX1jhjwt/+5tteqWnF776ql+iFIOsUd?=
 =?us-ascii?Q?jnKezWJy8FE2XPbWgydQjWmyhGatX2T/Cizyh9kwZ7ZhvyM0njKPQyFjZ9p7?=
 =?us-ascii?Q?ZvqdXLagKQ=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6423fe-5777-4452-d9a7-08d9e2729024
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 15:26:32.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDrny8CEqYMKFTOIDhAnd2kVAbhfsNjRFch4lMDSPU1BSN5No18KuDFC0pOfYN+0AowUyU/RdaRVNRWROoDuxbY1ippltlxo9ind5OuBb1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4205
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Am Fri, 28 Jan 2022 10:37:36 +0100
schrieb Hans de Goede <hdegoede@redhat.com>:

> Hi Henning,
> 
> On 1/28/22 10:30, Henning Schild wrote:
> > Hi Hans,
> > 
> > this looks fine but also looks like someone should test it. What is
> > the timeline on that? I would want that tested but will need a few
> > more days to actually sit next to boxes and look at LEDs.  
> 
> It would be nice to get this fix in before say 5.17-rc5, so testing
> this a couple of days from now is fine.

Gerd was so kind to just it done quickly today. He confirms its working
as expected.

Thanks guys. I guess you could add a 

Tested-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>

if you want.

regards,
Henning
 
> Talking about merging this...
> 
> Pavel, since the original patch has landed through the pdx86 tree
> in 5.17-rc1 and since these 2 patches are LED patches I was sorta
> expecting you to pick these up.  But if it is easier for you,
> I would also happy to make these patches part of a pdx86 fixes
> pull-req for 5.17 .
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> > 
> > Gerd maybe you can try that? Should affect 127E only and can
> > probably be applied onto our out-of-tree repo.
> > 
> > regards,
> > Henning
> > 
> > Am Mon, 17 Jan 2022 12:21:09 +0100
> > schrieb Hans de Goede <hdegoede@redhat.com>:
> >   
> >> Sparse (rightly) currently gives the following warning:
> >>
> >> drivers/leds/simple/simatic-ipc-leds.c:155:40:
> >>  sparse: sparse: incorrect type in assignment (different address
> >> spaces) expected void *static [toplevel] simatic_ipc_led_memory
> >>  got void [noderef] __iomem *
> >>
> >> Fix this by changing the type of simatic_ipc_led_memory to void
> >> __iomem * and use readl()/writel() to access it.
> >>
> >> Cc: Henning Schild <henning.schild@siemens.com>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> Note this is not tested on actual hw, since I do not have the hw in
> >> question ---
> >>  drivers/leds/simple/simatic-ipc-leds.c | 32
> >> +++++++++++++++----------- 1 file changed, 18 insertions(+), 14
> >> deletions(-)
> >>
> >> diff --git a/drivers/leds/simple/simatic-ipc-leds.c
> >> b/drivers/leds/simple/simatic-ipc-leds.c index
> >> 179110448659..078d43f5ba38 100644 ---
> >> a/drivers/leds/simple/simatic-ipc-leds.c +++
> >> b/drivers/leds/simple/simatic-ipc-leds.c @@ -41,7 +41,7 @@ static
> >> struct simatic_ipc_led simatic_ipc_leds_io[] = { /* the actual
> >> start will be discovered with PCI, 0 is a placeholder */ static
> >> struct resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0,
> >> SZ_4K, KBUILD_MODNAME); -static void *simatic_ipc_led_memory;
> >> +static void __iomem *simatic_ipc_led_memory;
> >>  
> >>  static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> >>  	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> >> @@ -92,21 +92,22 @@ static void simatic_ipc_led_set_mem(struct
> >> led_classdev *led_cd, enum led_brightness brightness)
> >>  {
> >>  	struct simatic_ipc_led *led = cdev_to_led(led_cd);
> >> +	void __iomem *reg = simatic_ipc_led_memory + led->value;
> >> +	u32 val;
> >>  
> >> -	u32 *p;
> >> -
> >> -	p = simatic_ipc_led_memory + led->value;
> >> -	*p = (*p & ~1) | (brightness == LED_OFF);
> >> +	val = readl(reg);
> >> +	val = (val & ~1) | (brightness == LED_OFF);
> >> +	writel(val, reg);
> >>  }
> >>  
> >>  static enum led_brightness simatic_ipc_led_get_mem(struct
> >> led_classdev *led_cd) {
> >>  	struct simatic_ipc_led *led = cdev_to_led(led_cd);
> >> +	void __iomem *reg = simatic_ipc_led_memory + led->value;
> >> +	u32 val;
> >>  
> >> -	u32 *p;
> >> -
> >> -	p = simatic_ipc_led_memory + led->value;
> >> -	return (*p & 1) ? LED_OFF : led_cd->max_brightness;
> >> +	val = readl(reg);
> >> +	return (val & 1) ? LED_OFF : led_cd->max_brightness;
> >>  }
> >>  
> >>  static int simatic_ipc_leds_probe(struct platform_device *pdev)
> >> @@ -116,8 +117,9 @@ static int simatic_ipc_leds_probe(struct
> >> platform_device *pdev) struct simatic_ipc_led *ipcled;
> >>  	struct led_classdev *cdev;
> >>  	struct resource *res;
> >> +	void __iomem *reg;
> >>  	int err, type;
> >> -	u32 *p;
> >> +	u32 val;
> >>  
> >>  	switch (plat->devmode) {
> >>  	case SIMATIC_IPC_DEVICE_227D:
> >> @@ -157,11 +159,13 @@ static int simatic_ipc_leds_probe(struct
> >> platform_device *pdev) return PTR_ERR(simatic_ipc_led_memory);
> >>  
> >>  		/* initialize power/watchdog LED */
> >> -		p = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
> >> PM_WDT_OUT */
> >> -		*p = (*p & ~1);
> >> -		p = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
> >> PM_BIOS_BOOT_N */
> >> -		*p = (*p | 1);
> >> +		reg = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
> >> PM_WDT_OUT */
> >> +		val = readl(reg);
> >> +		writel(val & ~1, reg);
> >>  
> >> +		reg = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
> >> PM_BIOS_BOOT_N */
> >> +		val = readl(reg);
> >> +		writel(val | 1, reg);
> >>  		break;
> >>  	default:
> >>  		return -ENODEV;  
> >   
> 

