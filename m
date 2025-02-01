Return-Path: <linux-leds+bounces-3862-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B9A24936
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 14:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FCC116407A
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 13:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C829153838;
	Sat,  1 Feb 2025 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kXpKr8Pr"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012049.outbound.protection.outlook.com [52.103.37.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21132C9A;
	Sat,  1 Feb 2025 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738414847; cv=fail; b=o7dEmmZO0phVqyE/BwzvBulbfN8nfHaZu11/BcVqlWtI/PJtQdahrFeQ3fNwzMGom5pcMeys/p1XWySomlBs6Vs4YsJ1QLSN8i2B/+KO0jLm7IDLa3xrR1CC6W/FSQId5xs1OEkM1t40kVPnNLzGDIjdanxOCPnaJSkRuRQAMw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738414847; c=relaxed/simple;
	bh=DsBWfZxryo/Qnz+YVsDU0vCSaVESGWLOtFRkUo5TogY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WSGkWlewkobwErvcov/jp4lChRHra+RDCGS4SB3dFJwWW41GoLS+OmYTlGRGQ1xV0bNVtvKfdVAlxEKnWigrKUt0eRWdfLRhsb/Tymu7hDdRp8G3DXQDokh2+Yt7d+fhTJyUGD+zzii4T1aTZbhh2H82lGcelstzsd2SX5GCYrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kXpKr8Pr; arc=fail smtp.client-ip=52.103.37.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/PjOZqdIM3PKwSAxO8m8o/3YfVaeiSH7Obc9wiZTSM2Oem5THaqwyhs+cucBgGGFyelpAFeqvHCNhGbKFhLAVpAixajjw2WvX+GJfXHGEQcV1Al/eMaDZXHiut8C4sLx+iRnJ0t2THPfoV5msd29bQwcP7meGVi4g+l/46uywS5ENbHIyVmn4Ycx8z22si0a+3mXZYF0k7K6H+e4QkjdzBynDYRB9lLlB6+pGCBzm1m5fklzoHnZQdLBzmLoLzx8l5G/Pnp3ya/hB5JjZiXNrCr6kDRZgb2f2h+2s9niU28pUH9UxqSkRH5LnRvodcp3UlRTwRwljWumXZsFtFZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9dovlF/EzDM+jTODYAhp1/uPMXBQ2jRGV1Ftf2jVxg=;
 b=OJqDBBMZQ4ZFx9y+0CbYSdgNmvJAf5uwIdAwVmwA3nNJCbj4an2p60GqLdsznh0xRFIxjXX+6g4L0AGRjFXjNv7P+sA5meqo9Fr+1zXg6TMqSahKVmiwEiB9d3Izzs6AMF9I9HDoAKDUVwekSnx1OqEylMH7DbSCEtiMkV+PzXetYlZcwnATA8SsF1PpHKStTKnGSD4gOqbW8/iIW2mCd1ISMj7U3Tqi/PfsWQ32Gbgt8mpJd+oe1Do8VOS9YOhcKkU0Akd9L0V1JpghvmPwblOmo5Q8hkuSNz+k+r43bZ/KtNdfp3JHffzYjlqaXXU1kZxoohjCv+haIlbr7jWtUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9dovlF/EzDM+jTODYAhp1/uPMXBQ2jRGV1Ftf2jVxg=;
 b=kXpKr8PrqB6rBWzWKsY/pwTwDBvFCgcmZAeNqXZ7RAS7BhU+QlcVgWgh0hnW2d33VRkH9Vo91pe3Y0O2HVmxJYQ5Y18n3i7ujBeaYD3O8d3ZC8EvewtlYyrAbCk54YS118r0yYpvPe3bfYA8VkuRpPAhlnNiqXKp5tWg/2H+2GJQZ5Kd/KPAZK2GFbb5dUdkgXs7DGPVfAv/zEBI84YLXSzim3eA3Um5QjlR/zPiV2X+Po2jqcvH6uk3NeNgvrgAb26zO8GPteVI4+ZVmxuJqvcFYq0wfHrwXXOrwMtMOtqXLr3ibXgsR+/dpSd5F9P5amx/ydAkK5AfEKLZ8zn1vw==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LOYP123MB2704.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sat, 1 Feb
 2025 13:00:42 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%4]) with mapi id 15.20.8398.021; Sat, 1 Feb 2025
 13:00:42 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/5] LED1202 / leds-st1202 fixes and improvements
Date: Sat,  1 Feb 2025 13:00:40 +0000
Message-ID:
 <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR07CA0049.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::30) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250201130040.1670772-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LOYP123MB2704:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6743f3-e5fe-4a0a-ed1b-08dd42c06ed4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|8060799006|19110799003|5072599009|461199028|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NDxn2wRErhDcM1qBFm+dJuhAwyJfDcvIBcPINEuvfG8kx15HubrmPHP8KPfJ?=
 =?us-ascii?Q?+cnzPu31OLCMSU64WXMbFOs8MPvqzFIxMBbImZ0qUs0m1JbDr9bdjvXPNWe7?=
 =?us-ascii?Q?dWhK9Wfq60j8kMKDR5d6f+h7nQs/ufidYmO9kuZ4vFH8PhYCgshAWtwmy2iu?=
 =?us-ascii?Q?/+FA7/T6UikCiKfnhjT1dAVTSWTgfGM8MSyEldmu+CmxqzT1sDMBgsTkngWG?=
 =?us-ascii?Q?zBO68Al7v+p0Om8px1e2/AxbHVL+hRWIm+WziGGOHPAxiqEjbefOWpnBx6dQ?=
 =?us-ascii?Q?sRKmr1BWCuLDfjrVEk9nRiUmfXCxYOebmtMQhBs6xcfUqWAr+Rl7cPwMwcO6?=
 =?us-ascii?Q?+TFHioPyjzvGwbEuAgQvEpw5gsGlz/upZkgfSJTN4Xi6pyLsOnGVez/pjhKu?=
 =?us-ascii?Q?6Ji8Z1meLLZJNSF6XA8Pm2D7BoajolbqBtNmrxCRrJjBcTHjtPpXfMdFBduS?=
 =?us-ascii?Q?GO2fzjECeotAZzOQ7I2X2M3t17jJvJmiTEoaLmVtZqRNJ8Cw5kDGCT1Vm2OF?=
 =?us-ascii?Q?8E9h9ymomA8AWaaN7Vn+fI1DxfpoP82dq8miEnKF8N8QNTZu9EyrVVngpW7s?=
 =?us-ascii?Q?pwGWH3oP8GqUolHEHCyxS49hCPNPKHeAyOa6GC2u/fYBohFnfMRdabu6drz7?=
 =?us-ascii?Q?jTM3KEQPmvWCz1kwY8SFX/DqoT4VK45GK4fE4yXrm1+ls/ULQD1ZVexpMAj2?=
 =?us-ascii?Q?4AZPnfphTgy+h8aikdUGF6g9h9Ikpw2DTCZzQW6XP6xpXpYAV3L+o5KhnV78?=
 =?us-ascii?Q?GYCG9f/DzlN7ge6k8kixp4xYtDGJqzG5M4wr0Aarn8GTAsYdokZfPFUOULB1?=
 =?us-ascii?Q?dnr7kNv+cyei7X6Xq2MyrBurCj0V4EGP61mWsVDQS0YFnn4m9Mh8cSNJRm78?=
 =?us-ascii?Q?62xDc+du5TteU31IGCLcMRDcB41B1oIve+YrS5jWROA8FTLngvO8O6UgYI1J?=
 =?us-ascii?Q?rFU3lZ8EtjGy6KxY6eaq685BxJv2C5DGclIwaVYfP4L5ry4CBgoZs+ZfWekS?=
 =?us-ascii?Q?yGjQIrD9JqTo6lDEcHqe9201p19f2VAK6yg1AtwboDdbv4YicREjpSakxty4?=
 =?us-ascii?Q?ugke0FOW456P0796yl0AKoYv8NNTRQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jaV1dQjrooqS05WlwoTRQ+BVfEaBCAr/Dmc3KYOtSRyE11V4ygiDo1TQlsAj?=
 =?us-ascii?Q?mouMVUUGRpkK8n36p9oYFPdKIaOqKoihujLHKU+p/HZ4Rl4Q5Y2hlNuRoMUf?=
 =?us-ascii?Q?o5rF9Z10hFGZKyCICujFXqstgNxtQMN4FkpUPNdFw5OtEsAtSYfnBydjadtn?=
 =?us-ascii?Q?AOUtAPHq7K/L2HQ1M7jmhwZ9C9aQ9YeGRg7j0MPsLegOvnpsRWCfAmJDpUUn?=
 =?us-ascii?Q?7RAkX7FELf3JcNcdNPQWhkCm4O16g7nxuQ0B7MqAWEEuDTSx4RXmOuFenuZ0?=
 =?us-ascii?Q?KUUmrCsGQ3UjJUTYEbKKMzYLn9pe2YkbXZW090fD/T7SK6l/r5tAqlcq2l5C?=
 =?us-ascii?Q?OaJWMVpKcKuBBu1lVkYbrYFw4krKVzJbMCv2UtvDHRfrlnK7Dt6LS4L7F6PT?=
 =?us-ascii?Q?uK+/3PNBZsGz9D8toF5ZoFLKqUdoTgmXyhMGvqyWuKPfDlWzI6nZHZi319W1?=
 =?us-ascii?Q?kBRun/QNwlnnsRvQe6JcAFs3GuRTIHndBcwRuwe1bQq64DGiSvn6fRzpk8Gr?=
 =?us-ascii?Q?FPQ+payn6xy1AGdivSXp0foe9sSR5VMOWRCANsd8ChoLTnS/6TG4GMFlJclS?=
 =?us-ascii?Q?swN7P/R6ncxFt5Np8BSYjShGuJTfTUpfORistWydRhkSpTJn9BlunD/Y9THI?=
 =?us-ascii?Q?ziycMiPTI0MpqCsIwxsNb73eC+GUgz9/Hq1lGyesaZBl+Lw2Lgeexw2HRs5q?=
 =?us-ascii?Q?7Ul1xonRBM0T41QYs+kP4GyDw5Ii2F67L/S8izaTXmjEPHZd/sPFu2wkLvt/?=
 =?us-ascii?Q?1zzp9CwetE0YZ4nDfj2/WNO0M2RlmtRZA1ARvDgTVsYgZPGkgXjt0/fHf34k?=
 =?us-ascii?Q?1yVYMTiSmKjLszCtprJ/m0Nnrw90PsOfIQeoFJqDZPW355JLLGblwLA/a90B?=
 =?us-ascii?Q?uH6HgEz9C/3K9w0E6DmKxLJF0bXzooHJS3Lx36ddU9aO3ZA9BAYwXYuvWnh1?=
 =?us-ascii?Q?iOVLvykWhdQBNioKQZUmwL0xChmPOu6GXQc97L8OPifPV0ehJRgyri2QLzfL?=
 =?us-ascii?Q?AeKlv+Zp4R4IgovVTCf/LF6ZW9l0llJgU2EdIfuHdoX33qkWeH9eylGuQe/P?=
 =?us-ascii?Q?GYcCY7Ng5XtLGKR8iZTDZmxsIHp/UQoNfkIrgdst3ZL3KSAwd36+DBB7XErY?=
 =?us-ascii?Q?fQ2iYasEeiS4f1PlOxDr24xVgvcV4WTFAruqVDJVsUYwwPu2MAPesNZJjasx?=
 =?us-ascii?Q?hB9UusdZJCUNbiOzgjNjBODMFesSBRm+0ExwccORrPQeEGhAJjsGTEsDsNDw?=
 =?us-ascii?Q?iRgzBiSt1R1lQkr7e4tO7zQLaROk9SNLScCAg3yI9o5R+kZ5dOxhpfEsTTwD?=
 =?us-ascii?Q?hbM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6743f3-e5fe-4a0a-ed1b-08dd42c06ed4
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 13:00:42.2099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2704

Collection of patches for the recently added leds-st1202 driver. It is the
same patchset sent on 2025-01-17. The cover letter wasn't properly threaded
with the patches that time, so apologies for that.

Obvious from the individual descriptions, but as a summary:

- 0001: fix a NULL pointer access error that occurs when LEDs are
registered but the LED driver is not fully initialized
- 0002: initialize the LED driver before any DT LED initialization is done
- 0003: some spacing and typo edits
- 0004: include the appropriate select in Kconfig to make sure the
required Pattern trigger driver is available.
- 0005: remove .rst extension on Documentation/leds/index.rst

Manuel Fombuena (5):
  leds: leds-st1202: fix NULL pointer access on race condition
  leds: leds-st1202: initialize hardware before DT node child operations
  leds: leds-st1202: spacing and proofreading editing
  leds: Kconfig: leds-st1202: add select for required
    LEDS_TRIGGER_PATTERN
  Documentation: leds: remove .rst extension for leds-st1202 on index

 Documentation/leds/index.rst |  2 +-
 drivers/leds/Kconfig         |  1 +
 drivers/leds/leds-st1202.c   | 73 ++++++++++++++++++------------------
 3 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.48.1


