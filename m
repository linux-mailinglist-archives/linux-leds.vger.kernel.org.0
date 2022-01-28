Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572EC49F65C
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jan 2022 10:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347599AbiA1Ja4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jan 2022 04:30:56 -0500
Received: from mail-vi1eur05on2067.outbound.protection.outlook.com ([40.107.21.67]:18230
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238330AbiA1Ja4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 Jan 2022 04:30:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTawgv+X1bIu73g8KS9MMAOcBZvXle36BudnEk1nXzI2XzL8GgmX9YtVnuTjOpUfg6rk/tRD3mR85U3y5QD7kdOuSjycxRbdLQx0Jaz6JqGs8JIFjg++GddCb3ZLfYq6+rtPOUXyokr3ucwBd7bfSWBPhNCD9TfzyG0e7NdvQGMZ0rbhY2WrY7cVvJPXL0OSfHMkzoYrpdRKzr4ab+jbYv7399LB9A+5E3hRkYsdVWXW5J5+dAvhbGCAB6JxOWsdZmv2zKfRDG74WXaEzTx6XZRvh7DelHbijKGAC6g6ZBXE7lO0ZzUQSC1c8b8bldihL6buToiYg5tahNnhQ2DS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEob4ASAHNACwWqcRVLZBjobK8QfV+9fCGf3YxRj79M=;
 b=SnjO9A8enPRfS81zRJqu6HQ6IZZIdImG5Cv0/B7duSxrT5XvhDPEb6cZpMWjn66aTCbS9IzBquiAX7qDVMSDKO8sGzZcMDSclKEZDD56gGdBU7uG77cFkWg6C10Fi7EVKeU1wxK6FNU1ofg/vnftuGM81Kty4/zZ3yV/qaUH9T1fu4LV3jFT+mX8LKuAqDgdqj9vb91R7SW7BK4UevLgoOf78/5es5zrYhTTlSFRyWteorqnP1tnvleB9hCWMxU9rRMFxsWf40KnrAj84T0ks0cjudu36MB/r52G7rmJn1tw/BsMsW6pQDfdpdnfmdH3FtlgzNUHdpu3APxF3vEx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEob4ASAHNACwWqcRVLZBjobK8QfV+9fCGf3YxRj79M=;
 b=MCyLwXxJxSf8IC4hpcqzC1IM011Np0WqB1jlYkB5mQEuX/6UREc3aokPv3owVm7liUYTEAYY4uRmLQqVQnMxpOq0GmnDrAvuOsgzjk7dJrZ1yU5BupkhzANDp3Z6FI1+X2l9Y+8WuJI5Wu1hDqvS/O8GkEQqg4Z5h7aleDkX2AqaFV20N/t9YebkWjwKIjJl3jFNLT/Ve7jH7VCFb8DG1ZgLerPE6ZW1KFS3UPqTfND2SEL2m1V24JAsAv4rBwZURw/MgeYJHGiipY40+lXcmxniDtsY/Gzk8t2VkQ70+zBUzZAOBBnlHQzm4Ft8bJp6rkZQW7rYrUvb4a+WVgJVmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::20)
 by VI1PR10MB3566.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11; Fri, 28 Jan
 2022 09:30:54 +0000
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95cb:ffb4:beca:fac0]) by AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95cb:ffb4:beca:fac0%3]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 09:30:54 +0000
Date:   Fri, 28 Jan 2022 10:30:52 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>, gerd.haeussler.ext@siemens.com
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] leds: simatic-ipc-leds: Don't directly deref
 ioremap_resource() returned ptr
Message-ID: <20220128102907.2bf438e2@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220117112109.215695-2-hdegoede@redhat.com>
References: <20220117112109.215695-1-hdegoede@redhat.com>
        <20220117112109.215695-2-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0082.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::23) To AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:155::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eab600c-b8a7-431b-2ece-08d9e240e198
X-MS-TrafficTypeDiagnostic: VI1PR10MB3566:EE_
X-Microsoft-Antispam-PRVS: <VI1PR10MB3566A166A455A2063ECCE75D85229@VI1PR10MB3566.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GRzOUBKo9ikDllqo5qGGajQFRV7U/8Dy9b50vEyyoZtJJ5SzNRw4erqZqXBYCvCDSk5BZguhHqTvlScDGpwGTJ8tiYzBYVoL9IepivvwGY4dC6FInjblYYvsDsSgFljJCvfOPHAlZaTQfCjneH0k5Wy19fDtPqshOkoAc7yLb2skoq9PLxPWkLZ49jZ6Qg2R//wK0RBgpofxN7EUK45nx9wQRa94wqtwaQjel467s7Fepnlkvd8V96ArvAfRFPClZ6x/ns7X+ozQ68oRvGtgvn5Lt2/+DQyRNosCV3G2z3s9TTJPf9E24QnU7DVyzC0vE4Ie4aDkeyZICE78OfPc3qGq2bSH84UcWCNIMPzW+G3t01U+Eq2xvpYwbRP8E9zANF0wVPe4am1ERRuDKBkxFyQ/g5RLdOlh/PWninxYH3H1y7cyeAb9hFjgGB+G+Dvy1qHJhwjOzSy1cqu8dgxJnRRRipMuT64QB0sYVJGPPbAijMze831RVr0pa/aclm5KtdOikb0AmLul5oaEPXdQrNolQD9Xd8NEmJbWNkTDDhTEnhdAGt6Pn7HSvAkdRFdp5GJeefG2I+omYRArZc8cj3fl/P76UXSuV9N/ISKG+r9ufHzcK3PMYh7SJLhCMvHFmLZPLu+lz1L3qossBua5Cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(6486002)(83380400001)(38100700002)(186003)(6512007)(82960400001)(1076003)(4326008)(66556008)(508600001)(54906003)(316002)(6506007)(86362001)(9686003)(8936002)(66476007)(6636002)(8676002)(2906002)(5660300002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bWFZc8D7zHVd41cYdcSjmM2bZavJZBJ50lApO3eVpA3Z+JDppGWKUs5s/doC?=
 =?us-ascii?Q?1B9Dd8XT0RuNw5yFfUsJbmS1tayCK7hDLZ0s3McWBHRa4aWmH4U4k+2CgyB5?=
 =?us-ascii?Q?GwxYIOIfg0nEIJYt7j855yYf/syoD9oqAEi8c9xehJiYfe3bzTxEmOmeTbDP?=
 =?us-ascii?Q?vVDUw0op2DHxGE7JOvYqR9YuD2VUMKXwyREPJ5Qm1Ef0zb5DdeMWnzb2d3E5?=
 =?us-ascii?Q?NYTNF0eAFOvG36A+fET7HbVDAoy4rHI/GqaTz0jFdlL9oIefwJIixUvmVBOW?=
 =?us-ascii?Q?Gck7e2rYpxJ+yu+Lo0D0BfPCot0ah4kYqPIRlk8BGGXF2DYi5FCro2p2sMbe?=
 =?us-ascii?Q?NS+EoiO/J/6DgzR1+0cziH87yQZMki6TusZPoAgMwsUweM8YUlR5JQi7ZBw6?=
 =?us-ascii?Q?ov9w/LwPs0o1sht8rwf03NKCEsi2v6Yiuhyotd+WpYsxq5IcWFoPWqIvPMiL?=
 =?us-ascii?Q?Q6xp3TxYyglBx2owtHY8WfklqTIQuc44lkXzcxqon15L9wV5/4UNCM0rLRvW?=
 =?us-ascii?Q?PQ7uqpx3u2SmPTPma5vPgcXG04wuhQwk42NxlXDmWto2FH9Zb8Em+mbIF8xU?=
 =?us-ascii?Q?UmBHiDbkV1zzcD76GlRR9nuEWuJIeeWGlGDwmj4CkUWqABPAbrDpmGcjEC5L?=
 =?us-ascii?Q?nRRsaXRhFN3DR7BbSJ7p0F2x3v0TYpg6/iO0ZBNxL59isQK0DzpsLRtaIB8u?=
 =?us-ascii?Q?ORCzR/lzqdUrtFknZal5Nb/yypGzzBJW4+F1BT+Y+/cSR8tM1zKea0Ub1/Ft?=
 =?us-ascii?Q?CRloJuWCEpAIMal2tni5Rn20JWCFbUMxH8AmT6wDS9GRNZfu9nqTtiCnBQHj?=
 =?us-ascii?Q?jczmwzjQiCdJb7JcNBwJ29a1b2oXNQewaPomJSHgHzyjyuo444LltLZP+V1t?=
 =?us-ascii?Q?TeSRevm23YyJdQwYfX8nsa04l3IUdOMu4s/uci2ojZl75r8sQsUEuxE0thPH?=
 =?us-ascii?Q?lTy+faz4PjVCAOYpIlhu8E4ijn5JnIsKZDRbbXsROqbzpZqT38HqlsCqxwT9?=
 =?us-ascii?Q?8mYgIc0KpNzSon6wrzoKL0wGxxOTjx9YhFRlqwXua5HiATEbVFnXg6Cu9YkW?=
 =?us-ascii?Q?ppEn5ocnTRZhbIMLoDlahtqnq2rQSzclNTFOCiS91ej79CqD9RlQAJNrv0a6?=
 =?us-ascii?Q?MuGI/Sjk/DDSBZLsjVe5iZoqxyfTQwAyqKGcP4gFNpN01fy8audlbrri7JZy?=
 =?us-ascii?Q?ZI3ncHc1so7y5inpfHSPfUWwYep3wVcWBEJ2rubO5jrioOt+JbLVqZCsPF2j?=
 =?us-ascii?Q?ZR28X4iqWWDvbeixU3M+Slyfe4jopGPnIs7jdKxpp64gn19DlelzatsFFeXo?=
 =?us-ascii?Q?lfTGAXhS2TbKhG6+anC/6/7ZIR9UfuVVDy/vR4V6RJr8QtZUU71at0rVjoiQ?=
 =?us-ascii?Q?Vy6rzqQhC8fZHMrSiaah8XjTsdshtHD0kF1Wv4+eOZpKaqkzZEkP7TNjOJ3D?=
 =?us-ascii?Q?ereXys8lMwCbbcvdNbHIwqkFtvTRULmGGTfLuym+cbY7SKnH0cgH7Nig6TWJ?=
 =?us-ascii?Q?ufkXkdySteN5iIx9p8043jIzdrS7k9b0yuyhbGd9jXEjFZuu15rz+It8REkA?=
 =?us-ascii?Q?o2HBkaB110mS48XJktPDfx3miDXaPEk1yNXolCbwINB8Cb3jd86RBGE7h2m1?=
 =?us-ascii?Q?HUwmH4CWZAqxRjS7wl1CNuQ6e8cjBmS3M4HHlJE/Z9NVS7hD8McIuD+I7a+e?=
 =?us-ascii?Q?1dbOzs9BWK8J+j6czCVQrPSdIHqREjFYx8O0zW7pL0gE8XLAynyi5T5FM+8F?=
 =?us-ascii?Q?5rJV63S9uTdcpH6c2MnkcBr1Bpwbgh4=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eab600c-b8a7-431b-2ece-08d9e240e198
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 09:30:54.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQrUxRXBqKIMK9BCamB5VJlEj3ZETqMhizchz3DOri+z4JRhAK4Q/KMEjaikqu7TQtS8CKMQeknfh2wXSD+ADMtTddPxkeX/Rwrycwc5rEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3566
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Hans,

this looks fine but also looks like someone should test it. What is the
timeline on that? I would want that tested but will need a few more
days to actually sit next to boxes and look at LEDs.

Gerd maybe you can try that? Should affect 127E only and can probably
be applied onto our out-of-tree repo.

regards,
Henning

Am Mon, 17 Jan 2022 12:21:09 +0100
schrieb Hans de Goede <hdegoede@redhat.com>:

> Sparse (rightly) currently gives the following warning:
> 
> drivers/leds/simple/simatic-ipc-leds.c:155:40:
>  sparse: sparse: incorrect type in assignment (different address
> spaces) expected void *static [toplevel] simatic_ipc_led_memory
>  got void [noderef] __iomem *
> 
> Fix this by changing the type of simatic_ipc_led_memory to void
> __iomem * and use readl()/writel() to access it.
> 
> Cc: Henning Schild <henning.schild@siemens.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note this is not tested on actual hw, since I do not have the hw in
> question ---
>  drivers/leds/simple/simatic-ipc-leds.c | 32
> +++++++++++++++----------- 1 file changed, 18 insertions(+), 14
> deletions(-)
> 
> diff --git a/drivers/leds/simple/simatic-ipc-leds.c
> b/drivers/leds/simple/simatic-ipc-leds.c index
> 179110448659..078d43f5ba38 100644 ---
> a/drivers/leds/simple/simatic-ipc-leds.c +++
> b/drivers/leds/simple/simatic-ipc-leds.c @@ -41,7 +41,7 @@ static
> struct simatic_ipc_led simatic_ipc_leds_io[] = { /* the actual start
> will be discovered with PCI, 0 is a placeholder */ static struct
> resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0, SZ_4K,
> KBUILD_MODNAME); -static void *simatic_ipc_led_memory;
> +static void __iomem *simatic_ipc_led_memory;
>  
>  static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
>  	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> @@ -92,21 +92,22 @@ static void simatic_ipc_led_set_mem(struct
> led_classdev *led_cd, enum led_brightness brightness)
>  {
>  	struct simatic_ipc_led *led = cdev_to_led(led_cd);
> +	void __iomem *reg = simatic_ipc_led_memory + led->value;
> +	u32 val;
>  
> -	u32 *p;
> -
> -	p = simatic_ipc_led_memory + led->value;
> -	*p = (*p & ~1) | (brightness == LED_OFF);
> +	val = readl(reg);
> +	val = (val & ~1) | (brightness == LED_OFF);
> +	writel(val, reg);
>  }
>  
>  static enum led_brightness simatic_ipc_led_get_mem(struct
> led_classdev *led_cd) {
>  	struct simatic_ipc_led *led = cdev_to_led(led_cd);
> +	void __iomem *reg = simatic_ipc_led_memory + led->value;
> +	u32 val;
>  
> -	u32 *p;
> -
> -	p = simatic_ipc_led_memory + led->value;
> -	return (*p & 1) ? LED_OFF : led_cd->max_brightness;
> +	val = readl(reg);
> +	return (val & 1) ? LED_OFF : led_cd->max_brightness;
>  }
>  
>  static int simatic_ipc_leds_probe(struct platform_device *pdev)
> @@ -116,8 +117,9 @@ static int simatic_ipc_leds_probe(struct
> platform_device *pdev) struct simatic_ipc_led *ipcled;
>  	struct led_classdev *cdev;
>  	struct resource *res;
> +	void __iomem *reg;
>  	int err, type;
> -	u32 *p;
> +	u32 val;
>  
>  	switch (plat->devmode) {
>  	case SIMATIC_IPC_DEVICE_227D:
> @@ -157,11 +159,13 @@ static int simatic_ipc_leds_probe(struct
> platform_device *pdev) return PTR_ERR(simatic_ipc_led_memory);
>  
>  		/* initialize power/watchdog LED */
> -		p = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
> PM_WDT_OUT */
> -		*p = (*p & ~1);
> -		p = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
> PM_BIOS_BOOT_N */
> -		*p = (*p | 1);
> +		reg = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
> PM_WDT_OUT */
> +		val = readl(reg);
> +		writel(val & ~1, reg);
>  
> +		reg = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
> PM_BIOS_BOOT_N */
> +		val = readl(reg);
> +		writel(val | 1, reg);
>  		break;
>  	default:
>  		return -ENODEV;

