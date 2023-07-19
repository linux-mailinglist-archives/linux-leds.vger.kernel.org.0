Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6846C7595ED
	for <lists+linux-leds@lfdr.de>; Wed, 19 Jul 2023 14:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjGSMvN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Jul 2023 08:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjGSMvM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Jul 2023 08:51:12 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A532A10B
        for <linux-leds@vger.kernel.org>; Wed, 19 Jul 2023 05:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9r0y6rPiemawub0zerzfqD7LlhJTSC0cyWEvDqneWc5csnjM6Q8OME4wkJFXL1jhEu1xCt9FiRgDiLd3PevPqS3rqYM8WH55awEmUpSggCPQBcRQI3A0D1RWvWGr1jgyP39TO8nltBRkSGM+6IXGYvx0n56Mj9u0CRpKgbFZ7Dmtx0WSbdfA6Wq/mc5bVQE87M+Wm2h1GqABgtiIib6388Vi3eqtBz7/CjET7nzw5OLDg4irjdmhkU2CBgo/zkA80uL6BI52QpOswgB7u0uf+xUakHJhwCHyxxnepxzDJE8D9yzvdxuE5ty3A5uQf8Y5SdaSuNULq/IJB9uK0RqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GKXsUitTm5zhCEb92ZST/aOnCLBFHwkmSX7t6ViUto=;
 b=XJQgKxrmCDca430o/SXnvsAgRpJRQK1MECOFNUCWcvXzjV/cRRrMbzKFh67yC6LoflUhRQB3FpinQJ+oeyQGbDkS9xRs8V65c3x1cvmDCNtibA0uTe77KsOimBALkaL/zn+28+thO+UGWjlPot26jNQjuDnmZj93EHKqoXqS17GAMTClwJKaJhK3SsDcqNPKAVwbA1LXQo45vKcibBGEYD20VwzXDJDDKwxiP+nksp6LvE+Ml5NZT9ac+z/ma2/1lyI58dH9DzKHN2fZq4QsVCzYMftw2dd16pKYOGsEYVDzffhRlzr9WIB9PzrQhESjCbEbQnsAw0m/8cBnFR91Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GKXsUitTm5zhCEb92ZST/aOnCLBFHwkmSX7t6ViUto=;
 b=MIqhPB26zRYHJAyjgzQRw+cQxAcvkJ737/3GthTQzTQ7vhTrk6FpBGhsBuyGxfx3DQEr7cXsxZJ8+dVdgWNzCXckYckY+hM/SUKjbSu35mhbRY9uObwybCvrMabhutleU9nh6l6g7+08blzcZV7B5txH0UC26e+5kSZF0edVJAY1RJRguwjx7yEZa5aUqosaxMJJD+z2wk5k/RDaT66sM7RP5bUTddlwOD+uMNg6uQwZLMAtFfXXVVYIg+P73FdIOyqAFvtPdZXwggASNgzOX92HpDnE62NH9MC8vtgBjIMjwclxl3wIyH9mrSCgn4RvlJeZkTVRQLmUhrZqFXwNFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AS2PR10MB7552.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:590::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 12:51:08 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a171:a3f2:99b7:5f29]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a171:a3f2:99b7:5f29%6]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:51:08 +0000
Date:   Wed, 19 Jul 2023 14:50:58 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "xingtong.wu" <xingtong.wu@siemens.com>
Subject: Re: [GIT PULL] Immutable branch between pdx86 and LED due for the
 v6.6 merge window
Message-ID: <20230719145058.5f09c0c2@md1za8fc.ad001.siemens.net>
In-Reply-To: <f16a15a8-aa32-214d-7896-af598e9d5000@redhat.com>
References: <f16a15a8-aa32-214d-7896-af598e9d5000@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::26) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|AS2PR10MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: a6eeb30e-1a87-4ae9-0cdc-08db8856d243
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KmmZMAJLyhWo15P61mbu50LkMiTgOhai60sgtdd5ePziXPuMLSdaIOIWrFH67pAFcg8kw28SWiW4SzhHcSv+shykt0eSlTLDHXHuw1W2j/r66/HZP1mHlgREEl6JSLRRRtknypBUMr3bXJPTSBJreIFLOr7d0bs6wDqXl20NOfYyxk+FyZ/Adbo3u7f8LR+yNMFslxk0iRaXO6dVPskhg7jqa5prNfZQb44W0SHzFeXyjVPPzJUC7adnEYoWwbeOvmt2e86HiT9UwyyBvqovw7zf1hQR5VI8YKm8uSnChOIhpe0WUH9OsXiv0zVCW4gnXShBIXhUYoehMbblSobYmaxE9fXN3cZeXV7am51CZsXEF3dUZRUZFcsWVqJqHwQ1ccItw27Yo2+6sf9VNiLIQr0Z2EO9MNJKa+r0gS6hXZyN/AbgWn8PSFeZ7QLLolKXRX3dlN882MpKO5b5j9IgSrOjbZedjvasdrzeYq/ygoTvPjKSK8UmHDJv/xp9A7uF3vnM4m/0pDsc1d7iQ5I5BWJ3OTODEF440/oLGjh6TyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(66476007)(54906003)(8676002)(6666004)(83380400001)(82960400001)(6486002)(41300700001)(5660300002)(8936002)(316002)(66556008)(66946007)(4326008)(478600001)(6916009)(186003)(1076003)(6512007)(966005)(38100700002)(107886003)(6506007)(9686003)(86362001)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8gNpbvsMdq+u5JVoaq8P0AwNJwSn0NCqDp9XcApXk0dXrEgG7rRbP/lhqwPf?=
 =?us-ascii?Q?Aow0Oh9WfR5NPIMP+/QyNtuVmCzr0qdb1l83E5QfroT0P95sWQT1s3g0iTP2?=
 =?us-ascii?Q?6l14JR2hbzn0VKfItPIfB4FGS69gmoHFGxiiA+LNX8pl2bUm/qAPBznenZLz?=
 =?us-ascii?Q?ZPfq4+2Rh2XjHDlrfnw96Mh20i9cnxd1f8D3LoicmfPY0g7NZL4nMqovBOEp?=
 =?us-ascii?Q?cG0e/ugDpguLCCBDM8d+695Dtfb/zwpDVAKCg9QNYh4NmfFupKPJVHH2RJoF?=
 =?us-ascii?Q?VWiyQlp7+omIw7gbPsEtEA4xIgYCsHYsLm/VyyCQdBCR4zMs3gB2A6qkTmHY?=
 =?us-ascii?Q?zJANwSjWCAfvpd9y+riKX5PYI2hNAhYVbQczIpyuvmcwFxgkGJ6ZRynbTCCx?=
 =?us-ascii?Q?ydg6IPzCE/yBCknK+pd5lrL3BcbfhL0QQQiFOtxdYDOghURZpBgxA+CJt3Nf?=
 =?us-ascii?Q?AuIuht8qNTbmA7xkAWAGd7gLWI+iSf0VJGpq5K5WOrGE4geAF8JZ4PeVKx+z?=
 =?us-ascii?Q?BwkghZQSPwCLRsjpYnY3ZqPfUpsAAADzmtU16nVkyfgJY8qvXIAvpVbpFAEE?=
 =?us-ascii?Q?Y6JSg+pgQvnaXyNQVk15m4jAO6nGiCw5GsAyvmKZaaWRed44gTSpFgnTEu+P?=
 =?us-ascii?Q?YAKPF3bg3xvYl4vEBE5FXAd1wz+Pz2eFwPM+9BGm8mcOOl8JYQcgA4cCqDUm?=
 =?us-ascii?Q?xs2rtFTtWP6Qh+Mkq2TYCiDsxWThT8z7HEj6aGEBxQ0l5UNWj5qaBog9+Nja?=
 =?us-ascii?Q?/xL8tC79uLbAyg4PoxsN+HmscB4etfLA3ExVGnxtl70wVzbRLtX/MWR1UqxM?=
 =?us-ascii?Q?f+cGXnqaPeYONmov9MdfocIjD3wdrQW3qCV8ub4U5HaayMgFgdOMF/SI0Erm?=
 =?us-ascii?Q?VRotniSQTvZHEsq119R/n/iTJsI7ZKt2Vw/y66OUSqOdeS4Hovlucbjj/xnD?=
 =?us-ascii?Q?Z2wvb49giebjIBx4R3VxHrUehQzwaAeXTxIsGOTXBoV2AHdjjm03EodKxCHq?=
 =?us-ascii?Q?9iTzGR+8V6JZ5CIo+UuUAfaoVX+e1Vp6YnUEqwOjwQYV5N6wD1eje50gnl+o?=
 =?us-ascii?Q?NHs/9RRWyoxK3SZ12eeSJrnpW83r/UQnNK+wSDwm7ga27zv0gtd6ioM4k6hn?=
 =?us-ascii?Q?ly5AbmDuHjQa+i5H6o17J+jj3Td6w4UldFoJsyP7HYh6t9iMiJNs/t2zf166?=
 =?us-ascii?Q?2apW9OBErGug9ZQo/fJz5Ambz9fHDorTHb90U2POaCTv6De8dtgtj0jHQLl7?=
 =?us-ascii?Q?aDGEwpJE1zZDSYCnO0xuvRYPszZCNBrJdbPDAIv7Tl8vCCTMsZ2U2/Zqx5sI?=
 =?us-ascii?Q?dIjT607UPMJn9M3Ykpt2AVP8nZluxkDj1Q8phkTWJMyLmRtUDbcyqPzC7w6s?=
 =?us-ascii?Q?WS5fGs8IIP0m8R5pMDRnO8ml6QQA7m5WY9tOhESY5DO8leJCUGy8AL0VU1P1?=
 =?us-ascii?Q?BncW4dOeB/Eo7Y8DNGV+X99UDql8hSGQ1PlZ7wVwIwxZnLrNwhcpSUuPpL1u?=
 =?us-ascii?Q?aYDV/W00GeGWMTBBnf/GrmSj/6KWBKqmN09JF2NBiS5F3EZsfnm50PR+PQZ6?=
 =?us-ascii?Q?yf1eBUzcZuz6fdnK+A7iBESnxW8ZWI9VsAyC8X/yLVChJZR61NtbV14NPmEv?=
 =?us-ascii?Q?NEElmNaRXaq90hsx7HdPYffhhIfe/pETMBSsU9LLGOtOaqqzd6UQlW35Z0Ib?=
 =?us-ascii?Q?cJiEpQ=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6eeb30e-1a87-4ae9-0cdc-08db8856d243
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:51:08.2444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VATb5fSxhz1PBzTho4990isylleF74pakimDYN+V3RKx8PBZyH58wXSepb3u2kBUTN0EEdHx+koWXf1ePJFVjGyFZ/00yrmSgPpNp0gaRQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7552
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Hans,

i actually do have a bug-fix commit on top of that, with a

Fixes: 917f54340794 ("platform/x86: simatic-ipc: add CMOS battery
monitoring")

one IPC model had a small issue left with reading out the battery state.

How should i proceed with that? Send that fix on top or make a v2 of
the CMOS battery patch after all? And if i send on top, can i assume
that the current sha will also be "immutable" when Linus takes it?
That last question goes into the direction of using "Fixes:", which
might not be needed/wanted anyhow because no backporting would ever be
needed if the fix gets in together with the patch bringing the bug.

Henning

Am Fri, 14 Jul 2023 15:21:12 +0200
schrieb Hans de Goede <hdegoede@redhat.com>:

> Hi Lee, Guenter,
> 
> Here is a pull-request for some pending pdx86 simatic-ipc changes
> which are a pre-requisite for merging the follow LED patch:
> 
> https://lore.kernel.org/linux-leds/20230713115639.16419-3-henning.schild@siemens.com/
> 
> (Guenter this also includes the watchdog change you acked for merging
> through the pdx86 tree in case you want to merge this into the wd
> tree)
> 
> Regards,
> 
> Hans
> 
> 
> The following changes since commit
> 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> tags/ib-pdx86-simatic-v6.6
> 
> for you to fetch changes up to
> 8766addf665e9f0ace15cca894ba225e5a4d580a:
> 
>   platform/x86: simatic-ipc: use extra module loading for watchdog
> (2023-07-14 15:06:40 +0200)
> 
> ----------------------------------------------------------------
> Immutable branch between pdx86 simatic branch and LED due for the
> v6.6 merge window
> 
> v6.5-rc1 + recent pdx86 simatic-ipc patches for
> merging into the LED subsystem for v6.6.
> 
> ----------------------------------------------------------------
> Henning Schild (7):
>       platform/x86: simatic-ipc: add another model BX-21A
>       watchdog: simatic-ipc-wdt: make IO region access of one model
> muxed platform/x86: simatic-ipc: add CMOS battery monitoring
>       platform/x86: simatic-ipc: drop PCI runtime depends and header
>       platform/x86: simatic-ipc: add another model
>       platform/x86: simatic-ipc: add auto-loading of hwmon modules
>       platform/x86: simatic-ipc: use extra module loading for watchdog
> 
>  drivers/platform/x86/Kconfig                       |  49 +++-
>  drivers/platform/x86/Makefile                      |   6 +-
>  drivers/platform/x86/simatic-ipc-batt-apollolake.c |  51 +++++
>  .../platform/x86/simatic-ipc-batt-elkhartlake.c    |  51 +++++
>  drivers/platform/x86/simatic-ipc-batt-f7188x.c     |  70 ++++++
>  drivers/platform/x86/simatic-ipc-batt.c            | 252
> +++++++++++++++++++++ drivers/platform/x86/simatic-ipc-batt.h
>    |  20 ++ drivers/platform/x86/simatic-ipc.c                 | 119
> ++++++++-- drivers/watchdog/simatic-ipc-wdt.c                 |   9 +-
>  include/linux/platform_data/x86/simatic-ipc-base.h |   4 +-
>  include/linux/platform_data/x86/simatic-ipc.h      |   4 +-
>  11 files changed, 607 insertions(+), 28 deletions(-)
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt-apollolake.c
>  create mode 100644
> drivers/platform/x86/simatic-ipc-batt-elkhartlake.c create mode
> 100644 drivers/platform/x86/simatic-ipc-batt-f7188x.c create mode
> 100644 drivers/platform/x86/simatic-ipc-batt.c create mode 100644
> drivers/platform/x86/simatic-ipc-batt.h
> 

