Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2153549F62F
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jan 2022 10:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243466AbiA1JWS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jan 2022 04:22:18 -0500
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:38951
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347582AbiA1JWR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 Jan 2022 04:22:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoCHH/qUGRsxc8JEhi3Ri8kPzYWAfF/Zfe0VUUbNTEThuQacpqG2P/9Ski5KsURtEqgdSLLZWemqZGXDxihn59OOdl/bkNxKbKWnjrHgnW9xPyAoxi7Ufed8dWn/R0kygYI0itrDdj3LeV8rX+lmStDVPIGZb3wygDCYG436lYt6aFskoVQyo4DCIl5DiQij4h5zsrBkGt2snQvAh8dx33fS6nzid532SEuU1DuSe5zhSxPEnU4KaZ5wrQRKZpmZgbTl4ZiGc52YJheE7PuYc+zuMNKLj0p7B7kBwUtTnAQt92Eno0k7V2nqYqbdgQ+BA7SZ63VFvDzn18TKN6LjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37el40s+jyEjDM2059id5v+2wkvnKQQzk7gcYSg5ysc=;
 b=Un/zQG9oqvb3T2D2AaQ/yd9itppcVEBzGToj6ViZEPeHWdD792ql3lSJVWtCeALeYCAMXHZoXy6+goyvpj9LUuDIXWgVAD6fBOmwYIVT5PQGLqXG8rCHri93DS7ADHBAns9HGnXufeTpggnp7pc8jqvZdGngW2QUNoLXDQzUb2wNFtUBiswy+bQoBVr8SVUd1qzzHCyEKFbkxfD/77VC/oDuf/T5mCguV3hJ1PkRT4hWE1aw98tI2JFe9SxwIlPnCp0aNR3gxhzkOqBNg2QlGTbz1I/P/Ecc0pwb+teXbgqf1/Pq6khjGd3eYU0HsiOuWdviThSOMNlTSZQSfYfEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37el40s+jyEjDM2059id5v+2wkvnKQQzk7gcYSg5ysc=;
 b=tylh+EDXdFk0FViIbw4LPz04OKgiQWTWoqE7/CHR66if0Gsay4aBGopEWDeFEAm1cOemr86V7LCu3TgCUw3XxrGbLq+dx6apcZ6BT3V8kjvMC11yu4Y9WeDT3X44LAVQTWd7fvnVM6Vy1EF/u5RYYBZMqWiffheEPkgkwZX9vrUf4RkSolqP1DzpaNXBx2rtXCWj2TZZQLHH1aoCDXcqCMgCeACF5ox+Y33n1CQa95KvtwG+72tk9TKVCrPRI7NP1mST9nbl0jTXg0UB5wNPL/ubVrP6ZTvfmysQNpILGIw3r7BP987O9Wf1EA2GkR/jHEncs5LUPD8j20hyGS9cHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::20)
 by AM0PR10MB2211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 09:22:15 +0000
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95cb:ffb4:beca:fac0]) by AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95cb:ffb4:beca:fac0%3]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 09:22:15 +0000
Date:   Fri, 28 Jan 2022 10:22:13 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] leds: simatic-ipc-leds: Make
 simatic_ipc_led_mem_res static
Message-ID: <20220128102213.51279801@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220117112109.215695-1-hdegoede@redhat.com>
References: <20220117112109.215695-1-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0375.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::19) To AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:155::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af4a742e-4385-4921-7bf6-08d9e23fac33
X-MS-TrafficTypeDiagnostic: AM0PR10MB2211:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB2211D7D6467EF1EAB41CB73C85229@AM0PR10MB2211.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJIkOWum0rrXPw8ADcryc4KxdlwflMV3GS+bcLog3OM10S/eKRICXl9nt07cjy8Ifg4D3oI5uJ79um2enntTMPsSnfRZTP0DbhuxtjpCnnTJpZRK5k+d+BPu92MXeY5gxJJCsBlOHGDTmIE6GVR3XaK2cVYZnf9WL9g1C1UwDAuMhbh0v/YdVhjrF3+p+9AGqc7SP6H4q/POanZ1DNp9vHQC0uZUvWoWwL6ou/7eb4amN3LTv0a189G8Q8hbgP0JIqM7d1h8ESL5IvfmV/sgwTbvXL8Gz0uYWMdxgS/Afgc+8sh7SM8y60qfdxSglybTVnLRldS/Qfhx22k8y+/pvB9Qre1hngXq8Vqc7vRMPnIK+rtiw8cWL3Jfxl21D7ZjuoAOHhGnRPM4RqPjjBM7ncQa1Ry23vYoZxVummH/8yKWCoB81vJVrZFj2VErC+Ffg6JXrfHU7CwwnfrdQzrMvNw4f684uwcvHw/1v6pr4LiZ0CRzI/+UTlTlgXvzZGv1Tce8Ao6+fGSgdw5XwfjsGReio58PCUf3Scjjt9Qji9MzEwFstOr/4a/vmgJdHcFJW3HcVoTarelLxMKERBVPworbYxIySGA0vxfRpvi/0cZYZu7e7oFmz5y36bGRo6/NFyU5wn66zv7uTBfeS4UOfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(44832011)(6512007)(2906002)(6506007)(9686003)(54906003)(8936002)(508600001)(4326008)(8676002)(66476007)(6916009)(66946007)(66556008)(83380400001)(38100700002)(316002)(1076003)(186003)(6486002)(86362001)(82960400001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7bclFDACIZ9uV15r8UwNfV/CkXsya+2XrR2kxkH+Bd3DqI1XVanVPlCWHIWz?=
 =?us-ascii?Q?jq6hVSZbhSv+aM03vrx48UG3m555dDOOQR8Cp+eKvI267x8AvJedupSP1/gi?=
 =?us-ascii?Q?+c6zMOiq5N7iiDNzX5ICVEVYq9rqU2WQFVYNPbmFIq7QWXchiOz1JGvjucsF?=
 =?us-ascii?Q?etQn5riSGKJzBK1lqCLuOiOeLmccDjBPfUwXGD4kTVsHVvZDJCRceWlQJ2/T?=
 =?us-ascii?Q?rE9gqJnnFvtD4Ds7ERIKpHjTgVWz7bYWVf27ErdroiGy1ZZNZegWosWUEtbI?=
 =?us-ascii?Q?MENdEBN34hKGhKA2UbGm2S7gEpM3hW3tGS+Yc1muJ30yObh3lV90/fWwRtlQ?=
 =?us-ascii?Q?X8d8AwSv7BJeGHptNyVvYWLyWpe4EFNwjlezJ2DWdqbKtlOuQ/b3q6qKYa4t?=
 =?us-ascii?Q?flz48XgTV4bYG35womKg4L8SLTHa016Rqb9YMtgezLFp62A+9WKfWKDgM0e+?=
 =?us-ascii?Q?2BLcd8PjBKo5npd+PrpZCyr8KDlV9E2BqIQPtd5NV9DqS9nv19JjqsjLQYxW?=
 =?us-ascii?Q?4WaVKL0QV6ClxfB2Khxe/j+LE+TgkKM4piG1za5D+Aoo41HUfGHqEnPHpXp5?=
 =?us-ascii?Q?KB9lhbeH88Bk4uQkscPuSy0NQYr/eEVAXM697g3bloveSpT0YmrW/KvTaBDz?=
 =?us-ascii?Q?mi9yYO8ZDsjMzd/zLzetaKDQpL9zBkUZieoCxzBLofzAr3Fa7u1jg76vD759?=
 =?us-ascii?Q?wIS142d6KV1DAPtHZY8ijBi0HNvQ0i1vhBzLPNSUzK2uTBnjXdebR0ltiHEH?=
 =?us-ascii?Q?EzshNGvyF+3r0XeyMw4Gg+w2m2ddKFWzZIY22EA1tabGU8z/u5h/o0d3deZg?=
 =?us-ascii?Q?MT479FKY8+Z0SAntlgm+MeoXW5XDfiHJzW+P+jXkndY2Uaz5h+a5NXbdnkiN?=
 =?us-ascii?Q?4YLECcemx9cbkvQn1BC+zZVTxMM+B1iVI9bqdp2G20lwG7X1JJgj8uuy3Y+A?=
 =?us-ascii?Q?RP+84VXFVafnnnF3sUwAMUYhl04RGiMmv2CaWX9uA/ReF2rynBCigd5la21C?=
 =?us-ascii?Q?VpGcTkL8irqprnBFAWp+lnyaZ4gD6PC3tD4+oajgHh2Ez0KIwImNLwyAY/lA?=
 =?us-ascii?Q?rDpU/5Es58Ikvhjh5Qzvju1zw2FSsSKJU7h6LzZs/qBt4iwmupRaGAiKVFTQ?=
 =?us-ascii?Q?PheSWuzQNkrRKXTdCwAcN0Qksu8qicg6NoR87SeiNjE6oGe282/I1aVlbmCL?=
 =?us-ascii?Q?gxYr4/d/ULuvJ8m+bCeitSEMtJy3ov5SvEarZg7Kj24Gyq6fVRg3MNOqZ7ry?=
 =?us-ascii?Q?24RFq141Z+z29RN8wenXXd+/NMdghP7Vjt26SvEgDiI6lvb/ebVQtbSsVYaF?=
 =?us-ascii?Q?GidS2bfMQuGg1MZbvSOh5Fbh5LiHRT0ILWSZOdOWMMfwNBzR/LNvwBL9BF0z?=
 =?us-ascii?Q?0gjuIubTt6HAfuhoe6b0lwoI0QtZjue2VIaxR9acdh0+ZLs3UD21Azx+Qydn?=
 =?us-ascii?Q?9e4+k4NdsKASY3c+pwtHOyQgQfS8UCq+2myIkLj2ToXQzTf2kf75M3Zymk7G?=
 =?us-ascii?Q?VvkSEPPOwLbwC0Uet7AMF+n0FkWvLM2ELzqBJgC+hM9kJt9ZMuG8+jo525Sm?=
 =?us-ascii?Q?JYOxyS1JDMT5Uzo8sxkfqMlLsd4Q5Bahh0QV46t+9xSsFf9x3hWB++ruMGA0?=
 =?us-ascii?Q?R83MDLuCHBaP6Ty93dICtWpgWGOLag7GGW+M/KMQu3048P7juqrn04dTRwVM?=
 =?us-ascii?Q?4QyFPFLTXEOheqpPHV1TG/a+Pyg99aVjwB7kJQMQaycWRB5RFyXSMr7TWN47?=
 =?us-ascii?Q?SW2ka9y8qJr2pgQsIZm+lLPU7YoC5ZI=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4a742e-4385-4921-7bf6-08d9e23fac33
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 09:22:15.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+lm6B+bNucp5G88N3/e6eMxj8Yj7/LLncCUPMKOeJdAo8+XX9CaYVplMu66VCyOb5zej0jaeAL4v9Jp+ZSs4eUOTnGDJSrYOzWS9HHkgEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2211
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

LGTM

Am Mon, 17 Jan 2022 12:21:08 +0100
schrieb Hans de Goede <hdegoede@redhat.com>:

> simatic_ipc_led_mem_res is not used outside of the driver, make it
> static.
> 
> Cc: Henning Schild <henning.schild@siemens.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/simple/simatic-ipc-leds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/simple/simatic-ipc-leds.c
> b/drivers/leds/simple/simatic-ipc-leds.c index
> ff2c96e73241..179110448659 100644 ---
> a/drivers/leds/simple/simatic-ipc-leds.c +++
> b/drivers/leds/simple/simatic-ipc-leds.c @@ -39,7 +39,7 @@ static
> struct simatic_ipc_led simatic_ipc_leds_io[] = { };
>  
>  /* the actual start will be discovered with PCI, 0 is a placeholder
> */ -struct resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0,
> SZ_4K, KBUILD_MODNAME); +static struct resource
> simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0, SZ_4K,
> KBUILD_MODNAME); static void *simatic_ipc_led_memory;
>  

