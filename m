Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 560AE7DCB95
	for <lists+linux-leds@lfdr.de>; Tue, 31 Oct 2023 12:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjJaLQ1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Oct 2023 07:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjJaLQZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 Oct 2023 07:16:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2023.outbound.protection.outlook.com [40.92.99.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEEFC1
        for <linux-leds@vger.kernel.org>; Tue, 31 Oct 2023 04:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifUFhkycu7xybABYEtOCaemA5Scodevv22pMLHeEmQrlbuw2LsntbZp0omcSwIzH9lKbF9BM2G/f9MZHHaypbKpmBPsmlyDKAeRIbD2XC1fCvhHih+n+NTrxAsUJAQ5zwBUOmAJdMYHAPwa8HKlg06IfZkuCkdtnyYOAms9bA19Ak6llcpPchbyCpbEAo4vpWXati4FWoVPW5WPmAjfvbUdAPkr0/AvAtyeZ7WGgG7wNsJVZd/ePjCz0ccIskCqrG+g7DKFIBYjjcbCtXCEfgnRn8mUmnGC3Ged+i6rV+rQmeoU5OziPiLTyVi5dolJUy8Vwz8tSVKOtKTw1DirlbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4otzMMMQZbtyK297yeTof2dq6ZFegRLMNV+L2Mtb4o=;
 b=PWqmUYbRyOpGg/51K4lLzkyZuTn64J11xcEeuOZw+2ML7VeMtVi2kydb9pVfjhS5CUlglJQGP6cmbTPSTjJ+zApxwgWq0pUogq11CrI7f7OhQ1w4kXegp0VCm0GgajW0HZvEYW7GPdrod4kZA0/9gWvf/qZSuiQt0Rhqp5QsPNv+ij4D1jYoqEzlxh1dNM9eIEdt/YENnHC2cJhl5IZa5j3ReNzfuJ8re24H5GcfHle58CY8AXT1yUM/a43JPIFjgxLQb83L9dhQYtPZYWpBKQaHRl6Fxo1p2s+F1vWvJUckxMg7oUMN0TcVkYwf/oyHCcjbVYmHazsSPP2pLgOFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4otzMMMQZbtyK297yeTof2dq6ZFegRLMNV+L2Mtb4o=;
 b=SBwz+MZAHZZ0aovdzhAsjuniPfs9O2THKErfLvJwEIWIK8tgUDyt8eu99LrSbpVe6ek8OQckhDvvgc3QKFK1Q3QwXLzS3a4WFxfCbyOKGRh7EDblZeuiwqX6j+JWhbMuXsMixwRK6PCoR2hwVhL+BmQUc6ksbOrampdEGYjH+X0k0buYOBNt4OyEqpZJkbbF/deE0UWiygS+Sfg0NUodVZW4cLeZaLlFWfmaxDMdLlq9hWePENFDQrXuPjvaX3ttx8ZrewevfYZVE7tITpr2WAceLxsl7ihdCnVBeoVEm9OJQCtX0NKzNLB99eVkHMp4OHMsRwjUr83aUNhfrUQ0Cg==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by TYCP286MB3638.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Tue, 31 Oct
 2023 11:16:18 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 11:16:18 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olliver Schinagl <oliver@schinagl.nl>,
        Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 0/3] add more LED color and function definitions
Date:   Tue, 31 Oct 2023 19:15:56 +0800
Message-ID: <TYAP286MB0315CC8749E3E40FC4B3DBA6BCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [C97drVvtKVwH3xaAx8JAHW66woUHtpeChiRLkzl1uxI=]
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20231031111559.12199-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|TYCP286MB3638:EE_
X-MS-Office365-Filtering-Correlation-Id: 886730a8-63be-4a1c-25db-08dbda02cdad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ml2LcKIxmOXlw5o6YR8+DSXAwH0jRRkJa0PQJqwjbngp9RugBT1JHsQbqkJftcC1l71nhgZirEbdIu6eOawTpII6RM8QznrjDuhYAechR0PwE3n/IJ9sLqEWjKN7QrnE2RLEY0/DXiBXt0ynrJF6LjQDi5G7/ah2JeJAxyc8lUbiblzbAXJsq7dHC0Wuwb58hTNOJpOsLQrTsm23RIzC6wv1jClyffo4rEU3yPpNHETwCCYEA4Pi3X0LzPCFSD7GzwStm8X+SnN4qbmsstPh2FeUtOzgQX4xHc/dJYdSrolCXQ/WNN6WO02A9w9AAXO4E/SqBonvIVpwl+C+/Oi7WTLAXkmZ1x85AqTsn2vmAf0f7LNwnCMRXIvlQIH1ocRpIpK1DCEpbNBFD+wQbc95+/dRtqrfhVmyCsmdYX0Y4k5c2gmNelzO4TWtOO6Rk0ZS01eKV23bybHO3st/UKQHwVjbqOm0JUVo6N5Lj24YyrSAm5qxIoHOSwNSjjc0PCBgYfSKYyML41KjtVjDgwLaZA34kobMACpRD+jntEvqquRgm6R7QCkGgW7tlSTlYBggQjM8SefRKmeEI6IrIrBgPk6qevkPJA0v+ZBSelCmDfZuaVTw/UHeAB8yu0wJbmnI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gTqMAW2zueV+54hI3/1A5o5WLH9E0NrAcRTpQSUpGaZTxyhjUb5moNqsn3BQ?=
 =?us-ascii?Q?MBw9TTBN4DSwCWKH8GlQqAfFf6ESYSHiD/e13HZIoOFNkeyBUh1/tbdkypPJ?=
 =?us-ascii?Q?aXyM9SbUB0h2ToIEfJ5hBd8M3n7rtCRmMfSuQ+HoshFAHCSKWTQUZXlPMNAH?=
 =?us-ascii?Q?c/RZSc/+IwdHvCOjT7w3xJ2FVSi9AAJIulycVJNQu6ffZI7Ip3+pyvU9sYID?=
 =?us-ascii?Q?nyFpu8Ri4indabGJzBm7TXLhf38HoVaDN0jz60l66iSI+2C5O6RSywUHlT9W?=
 =?us-ascii?Q?cq7E5PBk/0smhcUmH1mdoP4WPadz4jbBoYSrkLZQ/qNlWXgpv8HnRpjOUAnz?=
 =?us-ascii?Q?0lPn4tWfscMLG/3taGhjwEiVUi5xPtsh2GeC+ZFfexaZ6eXMWD9y9yt2HpXC?=
 =?us-ascii?Q?XKznwhCz/86JMV3+ymsZEwm3lt8gYg6QP0rfhtmUWW/bTdJoBcFGgyf+fB/s?=
 =?us-ascii?Q?TdWsJN+UTVX247tIWQWDKHv6e2lFsVksQ2J2MFt78tHc6+8fBAHBU2h4wpjV?=
 =?us-ascii?Q?TQfcqDNPMe/7DVvlsggQYyJsQLRJuuLv6RCBIb1U4B3IssKjYztJY6xWvye3?=
 =?us-ascii?Q?zR6P2YaTt3MXoiQKSuA8yVyVwVCcCWeP8sgp38p6C30z/ZE0Br7pNeyThn6d?=
 =?us-ascii?Q?MhkyhIL3HMgcSBe028gtTP2awnVc7WO8/AoAHqyvSxTrYPtmOrnpqaN+4PBS?=
 =?us-ascii?Q?am7xehr9QNNqQ6i9I65+ERVnB9bcd++FH4Ply7vDEx1WZFotmZ2R5AiMJu37?=
 =?us-ascii?Q?g3Ym+GzGmuHnIFkkcT5iYjxCz9F3pzuEeqJzSPjgCAlPly/5AMXRLYZ+cOGW?=
 =?us-ascii?Q?OU+vAxo3Qcubp45Gi/O2O+JpFjRD1PPdNzcNB7YLYnUXzZjA8GN70NNcJxg4?=
 =?us-ascii?Q?PWE2BJozSDyAyAd9OWAfqckE75SvVNm3bFVnev5r0mQnk1SL0U5BDlrYECbc?=
 =?us-ascii?Q?l5cUPOXCqoq9LM+qVx6FKGUgp261lp3m2PO+ZFK9hnEox3g5WzJQCN1LnJor?=
 =?us-ascii?Q?bGioCTtG2EoK9Z/GzIj++DHtdY4B+/CWq4mdR1QT26kfZ0DU6TOnNNFui0Ad?=
 =?us-ascii?Q?hDAKvvTsxHoc6KDE+ftgVX3+SPTEpDLDL0xUhearOldPx6dCmB4TCz4wrnDw?=
 =?us-ascii?Q?U/l7HnYEWdvdMU1BdKspQ0KlQtb3POxp20vV2wvRrRxf7WyexIrOEomLSa8O?=
 =?us-ascii?Q?cL6m6ca5LRkaoByGFYP43erYj9l/r4C4gzs96LBhSCGtyFg5JiBkZ7VVAxE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886730a8-63be-4a1c-25db-08dbda02cdad
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 11:16:18.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3638
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

This series patches sort/re-add the missing LED color definitions.
And two widely used LED functions "internet" and "rssi" have also
been introduced here.

Regards,
Shiji Yang


Shiji Yang (3):
  dt-bindings: leds: sort LED color definitions by alphabet
  leds: core: add missing LED color strings
  dt-bindings: leds: Add "internet" and "rssi" function definitions

 drivers/leds/led-core.c           | 13 ++++++++----
 include/dt-bindings/leds/common.h | 33 +++++++++++++++++--------------
 2 files changed, 27 insertions(+), 19 deletions(-)

-- 
2.39.2

