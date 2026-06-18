Return-Path: <linux-leds+bounces-8668-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GRSWOC8FNGoLLQYAu9opvQ
	(envelope-from <linux-leds+bounces-8668-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:48:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E116A1018
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:48:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="B3K/UjGy";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8668-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8668-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA7833045A93
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60D630C360;
	Thu, 18 Jun 2026 14:48:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013086.outbound.protection.outlook.com [52.103.46.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1DD2D97A6;
	Thu, 18 Jun 2026 14:48:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794082; cv=fail; b=r4/lb7DPnH9iu5XCC5IucoTvc+E/hfJcCn5VzlDM8FQJfaEqROEMRhafClcpUVUT20XtQb/Y2KgTs9yQMkQTYehALKa6YYA/Y7GlnVqkRavU/toqkFZPdFtOkQMcAV5UX3iZ39gaSr/3q3Di+TYXdOiA2AHuCMwRa/ShfB9rgno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794082; c=relaxed/simple;
	bh=BSeAlxV7CdXRg/WlhRdlHqc7HwcPPUfE7XONYXpCMuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p1n7yn9pXlXuLu/RtDm3Y8nvjn2q558WlJjlw/48F1ecIX7H5IkD0UiQ2VEfHBqIb8kprlVIV7N7jC8jhkJGdt0lR5AZnmW5F0xsQcpF0wgROQrK06Jt5iZiNL/n89MVKjMglHilQksvW3SFh+vgxyQsuAuveRq+AWZcl8nbPzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=B3K/UjGy; arc=fail smtp.client-ip=52.103.46.86
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFRAHYg++BLdxYXcNXnrpIMQy/O3U3Q2eBgmlOPpZ5dy/MjG73JlVmVzqryP1Q5WSLl1JrBsZYaJi2df9PK4GM2ZECGj2GAoz/1U2OGhzkIvqUSB7C5GPtE4qcGCBzUEJKw214DJNl4CS8m9hEeUGxyTUtAPD4P/3gatgKnVbepfSq96vWcx8OkWW+O9ZPsN2TYieKsjA9un+uLrX6/bKGJ13MwKku8rfVgv+ZjrzT3vToKe2wUletRxdhhVAMzHl/HCAk8NBDUP7JybxjBXkLjWHuy3JKhERiKhm0wnOQpM6vzHJEg97SzVvVgODAITZHryHnASEGgjKEX1xv0bUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFZXwnbdSXfbZ651Yy8wqhfBjgSAGbZ7SQaQu6l459E=;
 b=Z2qSToGLWuvk2iFAjoC3d9ys69P5cECcKQ207wvK3PdAWY/AcLn57CGrA65bOlYG1K6YZjxRcZDWGyYI9tZKoS6hXGw6wx1lanJYZ7NwjQkjNj4SchXbCy4QqZfSnHfj7ZEOOic3YGIHaVrvRuo0XQE6jMXFo8aiiuGtZsmf3cNH+d1LEG97qGj8pRspPUlmABtoqCCwFWssVoe/uz8GZHksRjTLbPFSefqjG1dJ+GlGeT2sI7ApEUnvVBHVdmNEPzd33GtKPlnWND1XAVOoZCF5bFyb16EopUapJsuBmqyMsE98loMm5Ar5600H/cx29L5IVIClLuLrOMpq8VWN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFZXwnbdSXfbZ651Yy8wqhfBjgSAGbZ7SQaQu6l459E=;
 b=B3K/UjGyl+BZ3gN2mKxzKgM7R9+XRA70C1NClshp/SFlGprCThJ3/DJjZbKjBo0wDk0F0RPtFz38cVd6X+RoXp05xJiDOzhGDH7a0ytBdsbwV0ydAOnNtwU4tTpv5SppXPHDavSJLzco5faLGWGw2u438MDNv0rPNPBn0iAHdxSRcWkUhysVetqJXPmFli53S5P1FWQP7yK/TMp0IldOhkYXkZE83hwGWxBZKSUQWc/nQZggi0moYcrMrrFYCbTiHTprkFHKQTrSmcCOCwGlsXNwUQNSGmTJiPOh1j+og8IofxvJk0iooNFEcUFkanHmUdGfYOmHgrENxNV2plmzhA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11612.eurprd08.prod.outlook.com (2603:10a6:150:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 14:47:58 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 14:47:58 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/9] leds: st1202: fix pattern duration prescaler and pattern_clear skip marker
Date: Thu, 18 Jun 2026 15:47:42 +0100
Message-ID:
 <GV1PR08MB84977E5943D0C0F5F3FA7F1DC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618144742.554314-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11612:EE_
X-MS-Office365-Filtering-Correlation-Id: 616cfba0-003f-41de-442a-08decd489667
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRf5AAVJ8TXpyQr/QWRq95q92v6FsDIMLk5+MgnA4gCbhSRev3i4YPaefdA1g5Qtbe7wVw86SOCpdAe1DMlDQH44aAtJF0WsshatB+FR92h2j65yAA7r6LlVr9eDIbvaAHGVCu7EXoy7JxoR6/UhQ7nJFzhXFn48Ox95eznzqfLwUC4xokRhkSEQyu8tN3Ayac63+LM0C2G5X3lFr+WlN8lCTLq5lCntMWj5yOjDQO0VobVrw7/Hqex+iDJXceWz74qPcMMQA3R4oFGpyeK8LzpUOm+uIvQxfOQtMapAuAFiYJ9vG5UH3GuTz7F3ZAq+gqnl3QBmv42mG5RXZX1LBysijjuWjOBSPw4zGKOVbAgY18aSpEiOCLeH2tLcWRq6J79GtOGuI6Eq1CVFDXzpSyvxvvWHrRA1FA++EstE3FPickqT4XQ9Llh4+MylqDGaHjWQ5S/AyyD2/39UgfqOLqadX3t+WPE7tPWQJqaR0kjWWO7rVStrWbV6y4vULL/+betFkWmnER1sFRJ5mVpnnZHpAUXnZbXuliVzgXXIPGRwU7Ide3X2e/iyRt5A+bgx12ChrYkqaJaRmAxXV7Wqw3U+pxzuBHFL/5eYgqSbXuA9yanqrJrTTpr8QFEuj856dQoKeUyXmBC+KVWHNf6j1KZ8XqXa+hCGX9McIxGY8ybyjX6hSySMqtiDPDr7DDOHy8bEnFnWmBqQFz+UeJUIDm0r8PmiYA5hYCU5KYppLHKzs=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|24021099003|6090799003|51005399006|23021999003|19110799012|8060799015|5072599009|37011999003|41001999006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU9GL3lISGlYS3h0UGMyQUFHL3B2SmcvWHBVNmZGRTBBalhtQ0E0TWVBYnJY?=
 =?utf-8?B?OFNxd3NpTUxZbnVicTZjbHJtVnhSV0NRdW94YlZ6a1JJS0t4b0V6eGxXdy9l?=
 =?utf-8?B?N2FOWlpuK1poZGhZUGM4ZU56V2pwL3lpMDdiT1UwSDFiWDhMcVpDQmNVVUhk?=
 =?utf-8?B?MEQycXkxdTRtNXMydituZGxQTlhoZklhVGt6RWZ4cTkxV1MyaFgxOVFvUEZG?=
 =?utf-8?B?OUJ3NHBTQ3ZQZ2JtOUsydUtpMlBqQ1BNQyt5T2pBQUpFakhpK2lSbmhZWS9s?=
 =?utf-8?B?NXhYMFFPYVRYK0thamtkMXNwczJ0Nk1GQWNqMnRYOElqNlB3aC9BMVIrRjNr?=
 =?utf-8?B?MU5jalNySDBiRGVwQmN3M0JTT1Q0OXF0cklUTkMxa3ExakhqdnFBUVRRRWpt?=
 =?utf-8?B?cWZzNGszVzVRbW9FVlFqYWE0c2I1L0Y3N2RvRGxVcUEwbHRHR1ZOOHl6QTZG?=
 =?utf-8?B?aUFJWXJWSjU4VGdsTWFYZ0V2aG1TZSsvTDcvOVUxOW9JSWZ6L1lkLzZmdnlJ?=
 =?utf-8?B?ME9uZG45TnJuTmp1MmkxcmdMVmpoa1ZmT2hVMDRYNEVHdHdSc3JDdDNRVUox?=
 =?utf-8?B?TUxGVjFWK0o4TjdlSHhreHlhbUdwSjZNMXU2bENRYU84Nm1ob014dm81OFpX?=
 =?utf-8?B?MjFRMUd6ckZGaVIrZ2tWZldvV3lFVHVRQXRtV1VVTS8zYzJZcEZvT2ZiSGZo?=
 =?utf-8?B?RjRRMnQyd2MzM1UvdExpZENUWTdkK05hTXZOTGNKNURSNXgrRWNDT1MzZVdT?=
 =?utf-8?B?Y3FBQ0I0Z3B4U3BnMWJiTVA0UmRiS2tiVE1BczZhdVlObmJTZ09SZGo0THpx?=
 =?utf-8?B?MGwxOFdMYkV2dFVuTTBIYVRsdmx3NXJIL0hHWmpqYzcrbzNSajVoSVRycm1L?=
 =?utf-8?B?Sk1Cd3VQV2ZsNFkrYlZoNDJLZWl1RWxuU1d2cm0yQm44cnU2MTZmcTZ5K1J4?=
 =?utf-8?B?OENsM0sxb3pNaEJ5RjkrOXRhcm1yR0xodWJ2U2Mrd2ttTDVWdmx4ekl3MHFt?=
 =?utf-8?B?ajJOcXVYaHpPR3oxSWh3ekljS1Q4bm9OVXFETy8wYytTb3hMTjZaNXRTbmpt?=
 =?utf-8?B?OXd1TWxSMXFzUEp6ekFZRUlpekhpNzFKeUZnTEV0MFJmeWFPV1RlbjFPRno5?=
 =?utf-8?B?b0M4eFRQMmVMMDhHMjQxSjRueitVVEZHd2VpNU5iVWJjcUYvN2N4QSt5NWxQ?=
 =?utf-8?B?SFBnQWZhT0pFNmhBSWxzZ3JrcnBiL2dscVJsa3FPSjR0cThucUhJQkVobHlO?=
 =?utf-8?B?c0VmQmswUUhJYnlPV0wyVVMrMThhQUZSSU45SzRETm9YcHRoT0ZwQy9Xd2k5?=
 =?utf-8?B?c3dnUmVjRDdJVitQS2xCRW84MXhxd05yY05TNWJxaFprbzRPVm8rY1I2TDFH?=
 =?utf-8?Q?2Mql0Dw3i2AioVBmyltZ2GPzyM2vyEfM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0lXOVJ3Y2NBY1R0d0FtaktjZUJKRk1wZzB0TWtTRWlyUFhEU0hWT0FpRWVh?=
 =?utf-8?B?WFdPeVNOTldhdW94T09pKzJ2VVlKVURlSHpXSzZqWFdlTXZDa2lGVWFKdkx6?=
 =?utf-8?B?TWhqTEwxc3ZhdjlKQURNVkgxRHFwOVMxc1Mweml1T1JQeVN6R0p0Y2t6Q2Y1?=
 =?utf-8?B?eWxJVWlSdFVnYVJpQ3YzQm5laFdQWFBPM0c2bTkwVnZiU3AzdnZpZ3dSNjlm?=
 =?utf-8?B?SkxoZnFiV1Q4QnAzVkN3dHJHKzN6c3R3M0xRbmtaTVR2SS9rbjlaRzlIMDBV?=
 =?utf-8?B?ZjJnbUx2RXI4eURDcDdENi9ncGxJZ0ZBdmlpb0xuMjJ3RFRHbjRLU2k1VXpv?=
 =?utf-8?B?WU8rMzhBRXBaSDF1L09QUjVYeTdHeVpaNjFLZlJXZXZPcWhPQVdZWUZZc1hz?=
 =?utf-8?B?QldaK3hoanRlRHNSSmZyUUtSUlpPMlk1cXdmTHZqZVZwTTJNYTgwdlhMZTVU?=
 =?utf-8?B?alZNczRUWlRJemFBYWUyY3RWU1NyYW9CLzRQUWQ1U2tIclpEZXZkbUJOaU1o?=
 =?utf-8?B?YU9LczU0SnBTYk4wVzBLVEt1SW9ISkk3TWszUmNuNGlpV0NvMnlFaThKSWgy?=
 =?utf-8?B?V3VNdlpLQ1lVOTBuYUVpb3dwVDRQZTlVYXl2K3lyV1pKRFo1QnZJcXBXWkpk?=
 =?utf-8?B?MmJjNVM2Z2lheUlqUEJnY1MyS1NPZklhdmJNUDFsakI3R2NuVzZCMitBdHBh?=
 =?utf-8?B?bmhwYVVLZE1IaU5rSTV5UnZVZmxrSGRubEJJOGczWDFUMXRNUkszUnZ2NUxj?=
 =?utf-8?B?WFVULzRjYkZaTmI0dmZwZHNZZWpSemRDVHJlZjR0M25ES0pITndJVVQzNUFx?=
 =?utf-8?B?bzN4TThndmZvd0hMQWlkVjBQR3hZZ2hEcWNmYkRhVmRVQitSR3lheHhlZkxZ?=
 =?utf-8?B?YkJIbU96cGszdWR5ZmhRelZRbHViWnJYaGozNlJDcFA1WnFOQ1U4WnQvRmR6?=
 =?utf-8?B?eFh4bXd1MS8xeFY3U2ExMXFUZ1hKUG5GUXJEZHNWSmNacmFESWFnSXphQmtJ?=
 =?utf-8?B?Qk10Q1gwakpUMDkxMWZqQzdRdXE2aU9pMENiaFVwVldsR1NDVEw5UDF3YWtp?=
 =?utf-8?B?azh3Wnh6UFVsZ054R25hdlJvMXZ1MGxSaWpJVDJGRUtCeGhWQTJjNDVyQ1ZS?=
 =?utf-8?B?Y09XT01DaEU1WDlGT3Q3NFRadXV0eHBBRmVYQ0ZKWmJhWVJJclVIcmZLeE1X?=
 =?utf-8?B?MDk3OGxYV3MzYWlNSHlIYU5GSzZFSHV6em52VXVnMmxCRUJ0ZzZMdFJuSURB?=
 =?utf-8?B?cHBGanZyZDUza0xyditrZmI2eEs5eUhpaEY1SVpwdlJXWVpjME5KMGtEV25h?=
 =?utf-8?B?UXJVMW1JSk5TZkYvZWRFUzJ4Vzd4RHF5N2RWeDAxQ1ZwTnM3VWduSzhjR2I3?=
 =?utf-8?B?MTVDZU9Ca2RSZU85WWUyQmxENzk5UFZ4ckdEMEpSMFFvaERSaUFndjBCVlF3?=
 =?utf-8?B?OHFpSzA5Snl5M09nOU5tN0k2SWF3aHh3Mm50MmJweGJSMTdsYm9GdzF1OGpF?=
 =?utf-8?B?UHZYaGtJa1F4Q2JOZlU1RlIzYndjQnh4VHVKU0ZncWl2R0UyVmN3ZmVjS3FJ?=
 =?utf-8?B?MEtOVUpOZUdRQlhRQVdNL3JpdjI1OE43dTYrY3JhWHFSV0pPUTNQdDhJbEwy?=
 =?utf-8?B?TjNOU2J5NDRnWmlwK2VjbUhxanlTbXNUL1hPZ0pPSjdld0JKNFcvZVBQSjZ5?=
 =?utf-8?B?ZkxpTU9vbys5L2tWM1Y2ZUpmTkdJdFhCNkYvS3hBZkRhVU9qSFZLMmJDc2Rt?=
 =?utf-8?B?L0crVWt0bUNXUWNsWXBRTGRvY0diS2lyOWtmU0VtZDhRMzlvaUlPWkpGTWhC?=
 =?utf-8?B?YjNEUGFacDhvL0VIZUNCZWRSbDdJWXlydHdmVWxIRkkvUGFVZEN2dVNSVndn?=
 =?utf-8?B?QllEb2hxODFCOGhpTDlUWXZRUVljVXQ5dXBkYjNBMGs1di9pNDNwQXpFNXdq?=
 =?utf-8?Q?75EB8vnRXVJW91CXjyw0QV8GB82seasF?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616cfba0-003f-41de-442a-08decd489667
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 14:47:58.2717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11612
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8668-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:email,outlook.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59E116A1018

The PATy_DUR register encodes duration as N × 22.2 ms, with register
value 0 reserved as a pattern skip indicator (§7.10). The driver
incorrectly subtracted 1 from the register value:

  value / ST1202_MILLIS_PATTERN_DUR_MIN - 1

This caused two problems:

  - All programmed durations were off by one step (~22 ms too short).
  - Writing the minimum duration (22 ms) produced register value 0,
    silently skipping the pattern step instead of setting a 22 ms
    duration.

The maximum duration constant was also wrong at 5660 ms. The 8-bit
register saturates at 255, giving a maximum of 5610 ms (22 ms × 255).
Values above 5653 ms were already producing a uint8_t overflow and
writing 0 to the hardware.

Fix the formula by removing the erroneous subtraction, and derive the
maximum from the register width so the relationship is explicit. Update
the documentation to reflect the correct maximum.

This exposes a secondary issue: pattern_clear() was calling
st1202_duration_pattern_write() with ST1202_MILLIS_PATTERN_DUR_MIN to
reset unused slots, accidentally relying on the broken formula to
produce register value 0. With the corrected formula, the same call
writes 0x01 (22 ms), leaving unused slots as valid 22 ms zero-PWM
steps and making the LED appear off for 7 × 22 ms out of every cycle.

Write 0 directly to the duration registers in pattern_clear() so unused
slots are always explicitly marked as skip, independently of the
conversion formula.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 2 +-
 drivers/leds/leds-st1202.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index 1a09fbfcedcf..a2353549469e 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -17,7 +17,7 @@ To be compatible with the hardware pattern format, maximum 8 tuples of
 brightness (PWM) and duration must be written to hw_pattern.
 
 - Min pattern duration: 22 ms
-- Max pattern duration: 5660 ms
+- Max pattern duration: 5610 ms
 
 The format of the hardware pattern values should be:
 "brightness duration brightness duration ..."
diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index a750c95ef3f8..b4adade49898 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -31,7 +31,7 @@
 #define ST1202_ILED_REG0                   0x09
 #define ST1202_MAX_LEDS                    12
 #define ST1202_MAX_PATTERNS                8
-#define ST1202_MILLIS_PATTERN_DUR_MAX      5660
+#define ST1202_MILLIS_PATTERN_DUR_MAX      (ST1202_MILLIS_PATTERN_DUR_MIN * U8_MAX)
 #define ST1202_MILLIS_PATTERN_DUR_MIN      22
 #define ST1202_PATTERN_DUR                 0x16
 #define ST1202_PATTERN_PWM                 0x1E
@@ -85,7 +85,7 @@ static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
 
 static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
 {
-	return value / ST1202_MILLIS_PATTERN_DUR_MIN - 1;
+	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
 }
 
 static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
@@ -209,7 +209,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 		if (ret != 0)
 			return ret;
 
-		ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
 		if (ret != 0)
 			return ret;
 	}
-- 
2.54.0


