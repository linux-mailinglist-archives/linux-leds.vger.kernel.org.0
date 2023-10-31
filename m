Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF977DCDFF
	for <lists+linux-leds@lfdr.de>; Tue, 31 Oct 2023 14:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344559AbjJaNin (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Oct 2023 09:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344585AbjJaNim (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 Oct 2023 09:38:42 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2099.outbound.protection.outlook.com [40.92.99.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA18FA9
        for <linux-leds@vger.kernel.org>; Tue, 31 Oct 2023 06:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPmAlDmsx6Avcpt1BoGcSYIOT41sUOlsKhxgAy2f2QFrRKkQHsinBIbvSlWxtGmpk3Xbm28DDSjhGbecO0OSoUNCfkzVuLGvx83JTEnUyEF5mnLu8lV3DGPy6yAKodYZHu2ViWC+yMsQcMWXDBHTSdQ5l1hOh6lTKViesUvpfoSk924pmlMXusBitSWcAlgJL/2bPl2lijCg2LLrxfK1F8oyjOhJRu9bqqQcqmoD2RlbyBizn0YF/3LuwROVbvStCBDENSVSB1W5q/Nx/vkTqvTgtwG8ii7FT1pBwGHk9Sg0V2qw/1nzaQyBoSB+/w+0KYH1HF6wAyqsPeY1avIhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THTrPa3Z2wn1wPGbsGKpOoifQUeWRKmoIG/6HyMIWsU=;
 b=eR0IhDLznLeGaBIM8YAHk98wIYIJYZPaIqSzeiWQvL4i1RdV3OydE2IAeXTupgqozh6E3TNzKKme9p0a+hipGvgZInNYAJiP6LFIEdNx1e7X7f7jMS1kw2jAQrmpd29Qszu+OJtQsSm7RCPt4Q1Y9yPEUxwOsAwvREzT2OR/zWW6x9HbXsP/wAkpq/k7n1FOEBT5FK6bJlvIbrEKNEdlYz6mjCbPVzytelCtiLLDGctE6DoL+vHUMzgYDLpB0P0CYGrPjW6Eqr6nVLL18/ZMSV3WNdmuIfdmTVBgaSzRCKi/W1DDVriDY9itpjQnaVUekLJ++C6ZIIaPt0yV5jQFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THTrPa3Z2wn1wPGbsGKpOoifQUeWRKmoIG/6HyMIWsU=;
 b=QVKsfet4Dy2d2lK81Kfg4EJ7tpCMVzFU0xRAAil6KTMYjG9y7w1dVz5pUNdYwc5Yj3fAo3fvWbdyA/PLl0DMF5AXAVX812LqoufHJNAFeYUqvP6eW/29jFeLyHlvGUf+BTJF79DD6BWVVq89bV/DA6ALCcl0qjyGTuVGHgGapHXRZ+yC8JmlAipC3xcFuU3SAmSfnGmJn+PLi38ZfsVaQwxPk/Qj6FFTlwr+DTcTN7bT+V86G1MjDP/1XXVB1xc5qTA4DYbhqtif1fOLrRPLjTx7gUv/O7tB5xWaT9yrZZiD3OERSBcEd7HBzvofxIz5n+Tt2sBued/b5hcsYgUA1Q==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by OSZP286MB2379.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:15e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 13:38:36 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 13:38:36 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     robh+dt@kernel.org
Cc:     conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, linux-leds@vger.kernel.org, oliver@schinagl.nl,
        pavel@ucw.cz
Subject: Re: [PATCH 1/3] dt-bindings: leds: sort LED color definitions by alphabet
Date:   Tue, 31 Oct 2023 21:38:23 +0800
Message-ID: <TYAP286MB03159232EAF38FB38BA457ECBCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAL_JsqLxVeA=F32H7ZhTxMJgX-BeAcm2nVdyvHBZdKxnTGcYSg@mail.gmail.com>
References: <CAL_JsqLxVeA=F32H7ZhTxMJgX-BeAcm2nVdyvHBZdKxnTGcYSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN:  [a+n36nzWYmlArMeY0So1Ks+ckKgPwqSY]
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20231031133823.13641-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|OSZP286MB2379:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c4d885-dfc5-4684-648a-08dbda16ae64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Q8lh3GpNlYagEj7hYyZ2y9vtVao+6P+pelRjUsFgmTHy/aHlLrVp7SiXNV5OI4dxPLNrLucrnbZDec2rjaSgdM9/AxiAJF6tmlUKYwY+PxyhXjlft/1PKmVPhi3eejVSDIvqQRYFI6FXm4KvX/8IVNEWNo0wPTVvDtUCSmD8xmJDITjys856RfpRX7syskFQ3EHERjEl/6hK8R4V4SGCKLLAQQNZ8y6blFOzmm4WpypuBwWK69m/U9PktU0maFpzbiJOKCTPisJL436B3aGWTUEZHexeMfSFdFmx2bsVe0WvF14B4V2sEg2/oqve4ye5KQB9Q4aLeaBd5d9HmIFxRPkQUDa1aagG82MqhBcgoORSIy0RYQFZN2qIapkyo3S5VvLasJ5P/+dV552ZK27hjbOdaOdANG5YDDsXfB6ihYgJ7dbXNzhWsNwwZJ/RpEbyGbSUAwcn7F7sj9022V+7ti2VjLsOZXswADPnJxahImrB+evrzY2GNNMZHyGbN3nuvMLf4pyorlIMwPIPF7/qPvFtDeZmYvmX/dNsiusByk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2FYT3JlTGthdk1RQnlaa3lTUlVwc1VWT3lOZWxtNllUU0kwYVhJVEpYWVN2?=
 =?utf-8?B?NVB1a3FNWDJuZitNVjFmZ3d3Ry9qall6QVpoVHN2RGRRUGYxYU5HRXJvdGJp?=
 =?utf-8?B?eHFXTVp5N2ZRODJuVFFrQ3Y2dXg4YnM2QjUwaW5mdTVSTXlSbVp0S0VOQ0pU?=
 =?utf-8?B?ZE9ISWg4OHQ3RjN4Vkl1Q1kvZEdPOE1vdmt6UG45cWRPTU4ydGcwMUl3M2V6?=
 =?utf-8?B?T1FDdXUwWUgzeFQzT29nV2V4MzF0ZFBTL0s2aVo0NHo4ZnBlNGhYKzRnTzBT?=
 =?utf-8?B?SHRRZjFrbm84L3J0dDI3dVFGZXloWDdJR29lc1VSeHdURFhVQUZ3N2E0dlIv?=
 =?utf-8?B?RkREbUlKVnkvL0J6UUlCdGYwcFhyRGZ5a21vTVo0R3I5a0ZZNlVPRnovNkZB?=
 =?utf-8?B?TGhrYWdRd1NqNHhZZ3lodTJKSzlHbHJSVk8yU3RjM1JGRWpFb1NQWVl3Rmhl?=
 =?utf-8?B?Q2t2WjFSQy9uSldXWU1nWFlsWVovT2R2Sm4rWmluZDJlOXJjeEJFZ2Vyd1ND?=
 =?utf-8?B?MkFKczgxNkF1TkJxK0dVbDNabDZNT1Q5ZnBDU2t5MEZCc0lpbkJ2ZGQ1U1pK?=
 =?utf-8?B?cy81dWI2VGl0SHM2TEQ0TFJZQmlPY0QyM2dYdHhWd3puWVk1ckVOVGcrNU1C?=
 =?utf-8?B?bVdIOWdlb0dGWVNFeGdDeVpUUGN5b1J1ekRzSWJUVUUzRk9jQXVkV29KM3hi?=
 =?utf-8?B?OGJmNHBqWXROclRTMWRtRTBPWlI2d2dKdFg0VTg1NWVpSmJ3RVhuUXBmME1i?=
 =?utf-8?B?K2ZDMXNZNnROZUpyZEJZeEpRcVQ4ZHJjQi9PS29uZkNQbTB4V3hpYS9kanRG?=
 =?utf-8?B?b3Y5dVNvN01oVkUrSFlsTmdBejM4a3FLZkFqSE5PMUJqeWNCNlp2WjBreFlu?=
 =?utf-8?B?SEhLYXBnSGlmOXMwMTgyQmFUczZSNG95UXBENlRiaDB3VFBtblJpREp5K0xI?=
 =?utf-8?B?MDlXakx5UWxGR3N0L29SdWp2MDBOU2FVQ0hweVEvZjMzTnJreDRwcDFYVlVa?=
 =?utf-8?B?ZzcyK1BJNE5WK1FtZWdOZWh0OFBTMWU5UWhaZm5BdWMrWFFISFh2MTRvd3Y3?=
 =?utf-8?B?YmcxY2ZBWmxtWEhXRDVGOXJIRGFPNmJaNzIxSEtrTGk5ellCbUtFN0pTRUJQ?=
 =?utf-8?B?d29zN1QxYUdIME5VbktXQkRBRys1azkyT2xvaU1SMTB6L0dKKzhsRHVTZkVG?=
 =?utf-8?B?NE54ekg0MUhSTEhkR01SMVcyR1hkeEpJL3NqZVVIbzhuMTcvOVFVaFloanJI?=
 =?utf-8?B?T2FQU2FmeU1JSEE2eitYamdONnNCaGhIODFLN2xEQVlxcDdKanBKMzZVRUtL?=
 =?utf-8?B?SkYxNzFoclRhVjFFQk84V1RFLzF3M2JRZXEwOTNhMGpnUzhtNFluRTducTNM?=
 =?utf-8?B?SG1iTkZ5UFNtM0lUY1lRSTg2b3BVU1RaZXlFMnZGQ1VNSTNLK042d2JGNCto?=
 =?utf-8?B?UEVrMzNMR1dSUFg2R3VYVkd3TVR2S296cWY5d3lkaGZFeG9HbTF3RzcvUXA3?=
 =?utf-8?B?NGxmNUxCNDVkalh4WjduaVRBRUpmcEwyTmVOTzlleUZQNlRSdFhnVHUzc243?=
 =?utf-8?B?eWhuS0lKaWN0Q2dqbDI2djdZbUNUdG5TTXliamg2Tm83Tm0rNWZaMHVCSWFy?=
 =?utf-8?Q?+A+Nqz85uHNws483sHv8AQTc2BmSURcQydeWc7nJQ+VQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c4d885-dfc5-4684-648a-08dbda16ae64
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 13:38:35.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2379
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 31 Oct 2023 07:12:23 -0500, Rob Herring wrote:

>On Tue, Oct 31, 2023 at 6:16 AM Shiji Yang <yangshiji66@outlook.com> wrote:
>>
>> Sorting LEDs by alphabet can help developers quickly find the colors
>> they want. Infrared and multicolor LEDs are special so they should
>> be left at the end of the list.
>
>This is an ABI. You cannot renumber them.
>
>Use get_maintainer.pl when sending your patches. You missed the DT list.
>
>>
>> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
>> ---
>>  include/dt-bindings/leds/common.h | 31 ++++++++++++++++---------------
>>  1 file changed, 16 insertions(+), 15 deletions(-)

Hi! Thanks for your quick review. I've sent v2 patch series and removed this patch.

https://lore.kernel.org/all/TYAP286MB03159A83A77E6FD59F271D9BBCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM/
