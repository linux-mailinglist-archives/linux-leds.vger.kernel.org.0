Return-Path: <linux-leds+bounces-8879-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QfuZO/3kRmrvfAsAu9opvQ
	(envelope-from <linux-leds+bounces-8879-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:23:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D07C6FD2E2
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:23:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=Pqu4cUsc;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8879-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8879-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67F19301944D
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02046385D97;
	Thu,  2 Jul 2026 22:23:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013013.outbound.protection.outlook.com [52.103.33.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076A832D0FC;
	Thu,  2 Jul 2026 22:23:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031034; cv=fail; b=MnpPuVn1AuXa/CXuiI+SLaeF1TyAfXktmFl7Yol7Xwc3XH5ltipMk4Jxop+nA09PG1BI77mMSH+mqzbjQdshwB+txpYQyr4mfOXRcN6RnBzVMQXFT0nm1oUihszSypK1wf+60I/qGINv6hvabujNw0WnAZQaQ2gDCLXyr2Lf1RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031034; c=relaxed/simple;
	bh=ZcEyxChsJsbijGTtUdyK0OOx6QiUUh5XAdQRTqF7As8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lAG8J7yzI3v0qE7OuqX/TOL6VF5H8H63urKCXYu031J5O2AW6f76146K1O+53Ock6GIQqgkucmqS/Kc4apBSRjt0Ddj24P4v3Ef4q7PRsVyJc8uAjwtc4ljKmmI5Covp17UyLyhb4ZP/R8AIDXvsBH13F6mk5tWnu9fx542EXIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Pqu4cUsc; arc=fail smtp.client-ip=52.103.33.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxltifLfLI56H33sb3Y0VWGo9M0H8NNgpqdJVU851YKfx72XoyYF8/dIZOFFfhQfKbSwJaA2AvBu2zI1asXzF9oNvGq60U8Dee0aMk42VDJYuGBHird/4THc8uirQ7UbkklkWpSPOdpsH41HuTqbjMXYP/5+eN2W3RaOFvATPVjv5qrzoXs09/gPOrm9lp1pW9/chqrhR22usggqFiMVJwSDxDd3/96P5APKFB4r+clYTpHT4UXLBHBeM90SSMoj7VoQale411AmYT2f8CC8y+qF97iIvwwnnAO2JCIVmW/X4+kbV1D5uTzirvPmmD/eV4SMZWI6jude+B90jVXaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voZAFgum/y+mCgQuGdfmH43KTOj7rv1/r3eBAeFDCXE=;
 b=IGzW1ic6OramaG5tdaMwk/7QNWqUJrbpTfRB3bBCw3OFaxMrSk0ZtOi461L1rotEa+962A9b15ilUJo+nmGtGmd2bndMspHZUFfz40tCDvbmHhV3MumwTkgK510RkBjiwkyrUg3W8gP4m92tYzeIyW4NYOrKAilKJz2MrfC9oG2g0ZLhD+YKLK3ZsGdKPQ9HRdo8StHdVn+6z1waFqNWIGXd0eyEj+9zHuBXZ6FdeSnNGKcWAHYjISKtinLRYiq0Gcr0DRPzufw4xzjrEFlzxh0xB/cDzQXAgNhsokDuCDPREbU8ygf0R0HV5hsbQf+WoLPyE9ZKgmcQFPOlyY2OqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voZAFgum/y+mCgQuGdfmH43KTOj7rv1/r3eBAeFDCXE=;
 b=Pqu4cUscgQ+8UHOHPJhHTndrxWerzO4U+Smq1Nu1WU9ELRUbq7pDUxYw0j9Xo8+jCf3ZXCrXcidzMvKlAPpJsYHAAARo8lQuHMTP0F1ePZatebmEFPymq4VAsaSc/MJhvOLpkgWL2hBZot/KvRYLZuvkw2kolgZFNMzuB7uTiSDageeOloys8cofUl7HI6b0uGkcMYpNSG+TcSGRrd4FtMM3dt6qxECC+LVJi+Ou7J/dvaPe9NJDwb0j8ptfFr2Z4sLQ3WbC14VWt0iTqPexb/9TkPPHuhvBzVE7i9JZyaOd2xHrCYX5Hkb5AxNJ6ZbWLYZ2UvVnOkG0WRT3lXClbg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB7702.eurprd08.prod.outlook.com (2603:10a6:150:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:23:49 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:23:49 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/9] leds: st1202: fix multiple bugs in pattern engine and brightness handling
Date: Thu,  2 Jul 2026 23:23:37 +0100
Message-ID:
 <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID: <20260702222337.62369-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: a5461248-e0c3-4956-e301-08ded88896e1
X-MS-Exchange-SLBlob-MailProps:
	vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkNIatwwPBEj8iguoAfsBKOy/6/6+2IyKUpbQm6QykpCDHzP1j7OC0yh3/oQsYhgixyiiRhl7u/R1EPm7KhOc5wXxzLsMzScMAy7AVPJKhZ4iYlLdDBmZlYfc45xTRf60UCZp/e6yKbS9YDOvEM7pkmJQ8X2lCo+f3xz+t2ezvrzZu3Ex93eO2KxFYKj2598npyGF13l8Oxwfr5NDHq/6CkQriNgt+JyRQRoaoAkWFjcyv7oUbOVemqyAGA8YkCcoGs9nIjU2cW7WwxChMvhM4dcLEZgy1Wna4S1lgFTWw6vwHFoXKlfv0slf+RoGwyl1kb+lCQ4csC+zhj9/99GEqbV0qNTquk6j203Jxmxk4pIV7eZVKxd0pr1PjoYOaDuVVUPkmli7T1b4axCx/sPpR1EE0gXPm0RQ5KJlqs7T03qqirPM9k5T2nM07oe2USUhhTwn0Kwys16lmGsSkhXxKBJjdjYRtcJ/MtAvokW77n6LORzgSrzMOcbE0E8Cwc9csYLgDi7O8shSi1RmOn0N559tdd9Yf/4QPMCHhG0eLKppvPQY7KQwEvgI1go6ZRA+2e2+EbWAti1V55G7fmXShholpPx3Rx612VDcGBF+I35CKNS6PDskLJu8SsZkIVQXetKiWNzCIewj0ipoCNa7ajhJdk6We0mXz2H4tU/sp2IQ1KS8h13FDzEmLja0HKjx33jD6Z7P8kEluk0kE2EBdpRP1629r36vFs/1oruDEwIw7CxNqhsBMgo8VcKU4oNOLtgW7mlgtz1XUUrmXEz3elEgXUxR7FLmx
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|12121999013|8060799015|51005399006|19110799012|6090799003|24021099003|5062599005|5072599009|23021999003|37011999003|15080799012|25010399006|10035399007|40105399003|1602099012|3412199025|4302099013|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0cyZkdnUG13TlMySk1YMFN2Q3dpcEtzejg3bzYzLzVUbml2emFBSkdJSUN3?=
 =?utf-8?B?Y0VOeEpUSjFwVm5Gc0d1OTdyb2V6eXFrOHpKR1owMmo2STBXZU5leEhQdWtT?=
 =?utf-8?B?K1hkM0lnL2JuaWZNLzFQbmw5M1Axa05zSENaTmJSWGh5L0dmd3lINXgxNmpH?=
 =?utf-8?B?OWl4UTIrQlpQYlpFcGsxWkhoK3lSZ3RxZlhRY1ozcm04cWptUE5RZkQ5TXJ4?=
 =?utf-8?B?UVVnWFo0cGR6MWhxTWdMSDJpQmFqMEs3cWErUmlTZGFEYXdkcEZQVUNvRzhE?=
 =?utf-8?B?dTdiVW56ekJ6TGJFLzQvSlIrUkNYbzZHd0Y5K2t3eGVKN3ZKOURRczRNdUVF?=
 =?utf-8?B?VGh4VjU5bFhEdW85WnVRUjRac1JBMVRJY1VWam9xd3gyZWNxRlRtVjlqSy82?=
 =?utf-8?B?MWlzWFNCNGU5L1lqMlBBOEdsZzJhRFVIR0JJMndzTm85M2VMSTNsNmlDOU9O?=
 =?utf-8?B?TmMyc1N3S1NTZFBIM3l5cFR2ZGs2c1FjbG41MnUyL3liMjFmZGZ1WEFPN3RS?=
 =?utf-8?B?VzM3RVFJbjNIcVBRcjZRZStBc2JVUW03WVlQLzZIS0E1SUlORjM4V1Y2eVF4?=
 =?utf-8?B?bWo0WGg4TDJwdXlMWVdJVFZSMmZGQmp6YlV0Y2JpcEMzV0lOUmhmRnM4NnBB?=
 =?utf-8?B?UXJrUUh2Nm9nWDlBZ2EzTTkwSVlzVFlrdlM0NkEwZXpIRVdSeWxnYmh6VmpX?=
 =?utf-8?B?T25iUU8vc2RyaUdWbVl6UVVkU3lJQ0FIUmdRek9sb1phTzdSc1BzTXJIa2dT?=
 =?utf-8?B?ejRCRWdHUFBrbGJ3NzdNRlZzTWFaWVlxQTQzZDBydW1xZ0twamJoTHI1RFkz?=
 =?utf-8?B?ZDNGSUg0cVlMRTFUem90REh0QlNwdjFwKzFkWFBEMmx6a0FHYVNkSFBMWWkw?=
 =?utf-8?B?dk8vVXovaDVERVpCaVZkVmx6R253NkRweEJYRVBtZTV3SVNwUklHOThmbjdY?=
 =?utf-8?B?c0NCd0Y0WVZIcG4zMXh5WGFCcFJ0aEY2Y3VxN0RhWWdTYUdkRzU4VnNhMU05?=
 =?utf-8?B?QStCWVUzWDFBTUErTFdob2FIblRUSGw1bFJEWkVGc2NvVUU3OU5tWkgrM3VE?=
 =?utf-8?B?dWlrb1hYRTlkQWxISW9IeXFkR2hPR3lLdmVNekRUNzVHd1M3NUZta3RjL1ZM?=
 =?utf-8?B?UXVOejNaMUVtYmRRbHFTK1d4WWhiR2dYNFVYWEJmZFpuKzcwTHNBRnlDcFdy?=
 =?utf-8?B?RVV1bkxhMnMzVk91SmNPZGtaNHhZV3ZlT0hJWmxGOENEMmRtWjlBOTQwQm1w?=
 =?utf-8?B?OEhWeXJzcFNXbFNDUWlSd2txdXdsdDJObFF4MTBIaDZpOURvdURnSWNNSHh3?=
 =?utf-8?B?QS9ESDBEZy9sTmczSXBmME5obnRjS3lCQ0xUUlo2YXZnVHFZSlZ4aWdKdlBj?=
 =?utf-8?B?WUxJdDVhTUY3cE5jWG1ZQnlOYlYzdUo5RGFHYUJtMTFLYncrakEyMkJQYmNQ?=
 =?utf-8?B?T1VqNlRvZWEwVkRuSFdKZ0I2Tkp0TDVqSTlXSm5NaWRPVStDNm4wcmN1VEdE?=
 =?utf-8?B?V1RDdlRtRXpEREd1LzB4NktjRFVXSHVsMFFOUjBjRFRXa3RIVUZHSDdndU5Y?=
 =?utf-8?B?WFF1QT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW8zTC93UGkrRUNVSW8zS2FtUXNNZGMyc3ZHazFSRHFHZGphc3pNMnZMSVcr?=
 =?utf-8?B?c1JwVk1iVUFwaGhld3VVUVYwN25Hd3E5Zmkxc1hneHRPdExyODB4ZzJwMHNs?=
 =?utf-8?B?MlBkMjYwVG5zNWhwTlpoVGt4Y1FsaXFZMVc2OWZWaTdVK2EydnVCMmlLd2dB?=
 =?utf-8?B?dEorejNqTTdEY1d1NGp0S2hBQmltN0hVMWp1M1ZIZnpSOEFFbEl1dFlLYjJX?=
 =?utf-8?B?QXJXZ0JDUElIbVJGb0ZGL1N5TFpkYzNXL09jbXNHVEZTdEVDYngvaDJFTlU4?=
 =?utf-8?B?RDM4SlFzaExGZUJheFo4OGErN2tEUDlJNkJnT0lBSVY0VXBra3dBM2NZQ2Vj?=
 =?utf-8?B?eUhxbHBoWWN4bW5RcjBOdFM3RnpKSHV6YjRLaEc4bEJyTDVxaDFiNHNYbTdN?=
 =?utf-8?B?N3hDWkFFYlFDVFVXSUV1NTcyb0s1VDNIT0tpZlMydlpUdmRmTk02eXlrUENQ?=
 =?utf-8?B?eXVZL3ZObmlvNHgvelNOUCtIeDlUQjFqZGE2ZlllbGNkRlAxdVEza2pqVzhv?=
 =?utf-8?B?UGlKbnRIYlJadDJramJ4dlo4SkZObms0OTJEZWJveGc5N3MzK0hjaEZSU01u?=
 =?utf-8?B?M1lYbjNZM0ZEbm5ZVnVwNlljc2ZVMVlNaTFoTXFQbjZ6bHFMTFNUa3cvZUJF?=
 =?utf-8?B?Mk5VRlZZMmMrZklhLzdUdHpaWGpVT2o1Q0M1WnZlZzBFZXVtaHI4WHJrL1Rl?=
 =?utf-8?B?SzBqMVVROW52QVNsNDR2Q09hTytVeURZSWNGWWFFbEFwdFpUclVPZldHb0ZY?=
 =?utf-8?B?cTF1cldtWStQTEFQTm1mOVNrc1d4Umw2RWd4Q0Zvb3gyQ1M0K0IwbWNrano5?=
 =?utf-8?B?RzJTRzhzTWVqS0tiVXV2RXdHblh0Zzc5MDl3UTFGTUJoOCtyZ1JKc0Uzc0dR?=
 =?utf-8?B?SXozdGdwQmZQVjdORG1sUkhGR1FMT1pYRkd3bzQrdys5SnQwL0hvWWNqcTdv?=
 =?utf-8?B?QjYzTlNpQ1RGUExkWmZDamlrTUtoZTVoUHpzMjJqNURMV2h1WmsrL0ZBS0RR?=
 =?utf-8?B?RlpXYnd3cTJiOEs2VTdsVU5rMWg0T2loaFU0SlJkbzVoWExQeFV3dFFyMi8v?=
 =?utf-8?B?Nyt1dW0zVnZNZ0xxZ0RDc3U5VUpURHRyOVRqRjJjUmQremtOVGVqeTZQNGUv?=
 =?utf-8?B?a0k0WFhUSTk1NlF0Nld3MjJnT2tPU2U2b0laRFBaYVAzWkQxVkJhM09nRVlE?=
 =?utf-8?B?dFpOL2dIUzJrcWMyNHpSbzlxS1VCY3pCSFBRalZ1a0EwZWJNZ0NrRS8xQmtm?=
 =?utf-8?B?b2ZKa3dzcWVPdmc0V04yTnpQbTFCaU5mR2dqOVczYjFIK2ZoTGRvVnozSDhF?=
 =?utf-8?B?bzRqRnVDVGdhT0ptU2xDZ2dLTGNOWGU0cTRkckMrRTRqSmNCWko0TUt6ODZQ?=
 =?utf-8?B?K2tacTB2L2RjT1h0bzJNeUgxcGI3NVlwU3dySldRNnMvenhXaFBnQ2ZSL2U5?=
 =?utf-8?B?YS85ZXZzcXVmR2N6QUtnUHJGTEdJZzI2Y2t6ZTRFTGZqU0hYdWM0Z0tKN0pH?=
 =?utf-8?B?a3BIMmlrR0hmR3czMzVleVltWXh3aUdic0ZWYzNNSDhRREgrbzBKMzJEMWpW?=
 =?utf-8?B?ek1haWFmR2JCa21BcnBDVjRVSUpPV0RkM0wxTFBQMVg1TDkwT3N5dkZmVkV1?=
 =?utf-8?B?a1Vjd1JBbWJlSDNTNWhPTFBqWk1DYWFqeThsZkR2eWMzbURFVlc2V3Ixem9k?=
 =?utf-8?B?a3BjY0lwOUtmZndiaUd6ejhIRzVXeWt1QXQ4ME5xcGN3WDcyb3VtTTVaeEtu?=
 =?utf-8?B?TkdLeVEwZ0xGRnN4aWZIaDNWc005T2RuOVpCaVl5WGFaNm1vWjlHTCtkUWY1?=
 =?utf-8?B?Q0FuTmoyWWE2WmtMR1gxYURsZCtzR2RrOUxVNVpwbDAyR1g2a2tGejNYYjBN?=
 =?utf-8?B?Q1B5ci9Pb0RCTE96V01FWmNBWTZDTkRtSkJSNEEyK2QyTlZsVVpTUCt5a2gv?=
 =?utf-8?Q?DFHHtO5W2QVQgpqFVJrDhVURHhh3Ce/C?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5461248-e0c3-4956-e301-08ded88896e1
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:23:49.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7702
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8879-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:dkim,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D07C6FD2E2

This series fixes several bugs in the LED1202 driver related to hardware
pattern programming and brightness control. The issues were found during
testing on a Linksys MX4200v2 router running OpenWrt.

--- Pattern sequence not stopped before reprogramming ---

The LED1202 datasheet (section 4.8) states that writes to PAT_REP and
pattern duration registers are only applied after the sequence completes
or is stopped. When running in infinite loop mode the sequence never
completes on its own, so these writes are silently ignored by the
hardware.

  Patch 1: Stop the running sequence by clearing PATS in the
  configuration register at the start of both pattern_clear() and
  pattern_set(), ensuring the hardware accepts new values immediately.

  Patch 2: Validate pattern input before stopping the sequence. An
  out-of-range duration value should be rejected without disrupting a
  running pattern, so input validation is moved ahead of the sequence
  stop.

--- pattern_clear() leaving hardware in inconsistent state ---

Several independent bugs in pattern_clear() left the hardware in a state
that affected subsequent pattern or brightness operations.

  Patch 3: Fix the duration prescaler formula and the skip marker written
  by pattern_clear(). The original formula (value / ST1202_MILLIS_PATTERN_DUR_MIN
  - 1) was off by one, producing durations ~22ms too short. Additionally,
  pattern_clear() relied on the broken formula to produce register value 0
  (the pattern skip marker) by passing the minimum duration. With the formula
  corrected, pattern_clear() now writes 0 directly to unused duration
  registers instead of going through the conversion function.

  Patch 4: Set all 8 pattern PWM slots to full after clearing. When only
  Pattern0 is restored and patterns 1-7 are left at zero, the cleared
  channel blinks if the global sequencer is subsequently started by
  another channel. Setting all 8 slots to ST1202_PATTERN_PWM_FULL ensures
  the channel outputs a steady ILED value regardless of which sequencer
  step is active.

--- Spurious pattern sequence start during setup ---

  Patch 5: Remove the write of PATS|PATSR to the configuration register
  in st1202_setup(). This accidentally started a pattern sequence before
  any pattern data was programmed, producing undefined output on startup.

--- Brightness control broken while pattern mode is active ---

  Patch 6: Fix brightness having no effect while pattern mode is active.
  When PATS=1, the LED output is ILED x Pattern_PWM / 4095, so writing
  only the ILED register has little visible effect. Rather than stopping
  the global sequencer (which would halt patterns on all other channels),
  set all 8 PWM slots for the channel to ST1202_PATTERN_PWM_FULL before
  writing ILED. With every step at full duty cycle the output is ILED
  regardless of sequencer state.

  Patch 7: Disable the hardware channel in brightness_set() when value
  is zero. Previously only the ILED DAC was zeroed while the channel
  remained enabled, causing residual current through the enabled channel
  and a visible dim glow on the LED.

--- Input validation ---

  Patch 8: Validate the reg property read from the device tree before
  using it as an array index into chip->leds[]. A value >= ST1202_MAX_LEDS
  would cause an out-of-bounds write during probe.

--- Documentation ---

  Patch 9: Correct and extend the hw_pattern documentation. The maximum
  pattern duration was stated as 5660ms but the correct value derived
  from the prescaler formula is 5610ms. The repeat field documentation
  is also corrected and the brightness range is made explicit.

--- Testing ---

Tested on LED1202 hardware via I2C. Register state verified with i2cget
at each step. Correct LED behaviour confirmed across pattern cycling,
infinite repeat, pattern_clear, and direct brightness control with
trigger=none.

--- Changes in v7 ---

  In response to automated review feedback (Sashiko) on v6:

  Patch 4: commit message inaccurately described the baseline behavior
  as restoring Pattern0 to full duty cycle with patterns 1-7 at zero,
  which reflected earlier iterations of the series rather than the
  actual v6 baseline (all 8 slots at LED_OFF). Commit message corrected.

  Other pre-existing issues identified by the automated review are
  outside the scope of this fix series and will be addressed in a
  follow-up submission.

--- Changes in v6 ---

  In response to automated review feedback (Sashiko) on v5:

  Patch 4: pattern_clear() restored only Pattern0 PWM to full, leaving
  patterns 1-7 at zero. If another channel subsequently starts the global
  sequencer, the cleared channel cycles through its PWM steps and blinks.
  All 8 slots are now set to ST1202_PATTERN_PWM_FULL, unifying the loop
  to a single pass from 0.

  Patch 6: brightness_set() stopped the global sequencer via a write to
  CONFIG_REG, disrupting patterns running on other channels. The sequencer
  stop is replaced by setting all 8 PWM slots for the channel to
  ST1202_PATTERN_PWM_FULL, so the channel outputs steady ILED regardless
  of sequencer state without affecting other channels.

  Other pre-existing issues identified by the automated review are
  outside the scope of this fix series and will be addressed in a
  follow-up submission.

--- Changes in v5 ---

  Patch 7: Restore Pattern0 PWM to full duty cycle in brightness_set()
  before writing ILED. When PATS is cleared the LED output is
  ILED × Pattern0_PWM / 4095. A prior zero-brightness hardware pattern
  leaves Pattern0 PWM at zero, causing brightness_set() to have no
  visible effect despite ILED being set correctly. Found through further
  hardware testing.

--- Changes in v4 ---

  In response to automated review feedback (Sashiko) on v3:

  Patch 7: pattern_set() did not re-enable the hardware channel before
  starting the sequencer. If brightness had previously been set to zero
  (disabling the channel), the pattern would run but produce no light.

  Patch 8: reg was declared as signed int but populated via
  of_property_read_u32(). A device tree value >= 0x80000000 would be
  interpreted as negative and silently bypass the bounds check. reg is
  now declared as u32.

  Other pre-existing issues identified by the automated review are
  outside the scope of this fix series and will be addressed in a
  follow-up submission.

--- Changes in v3 ---

  In response to automated review feedback (Sashiko) on v2:

  Patch 1: Extend commit message to clarify that the LED1202 has a single
  global pattern sequencer shared across all channels, and that stopping
  it in pattern_clear() is therefore an inherent hardware constraint rather
  than a deliberate design choice.

  Patches 3+4: Squashed into a single patch. The prescaler fix and the
  skip marker fix are tightly coupled — the skip marker bug was a direct
  consequence of the broken formula — and are clearer as one change.

  Patch 5 (v2): Dropped. Resetting PAT_REP in pattern_clear() is
  unnecessary because pattern_set() always stops the sequencer and writes
  its own PAT_REP value before restarting. The reset introduced a spurious
  failure point without fixing a real bug.

  Patch 4 (was 6): Start the clearing loop at Pattern1 to avoid writing
  Pattern0 twice (the loop previously zeroed it before the explicit full
  restore).

  Patch 5 (was 7): Simplify commit message — remove inaccurate claim that
  the SHFT bit is never re-enabled after probe; pattern_clear() restores
  it during probe.

  New patch 8: Validate the reg device tree property against ST1202_MAX_LEDS
  before using it as an array index.

--- Changes in v2 ---

  Patch 3: Fix commit message wording — programmed durations were ~22ms
  too short, not too long.
  Patch 7: Fix Signed-off-by typo.
  Patch 10: Add missing quotes around commit subject in Fixes: tag.

v1: https://lore.kernel.org/all/WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/
v2: https://lore.kernel.org/all/WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/
v3: https://lore.kernel.org/all/GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com/
v4: https://lore.kernel.org/all/GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com/
v5: https://lore.kernel.org/all/GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com/
v6: https://lore.kernel.org/all/GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com/

Manuel Fombuena (9):
  leds: st1202: stop pattern sequence before reprogramming
  leds: st1202: validate pattern input before stopping the sequence
  leds: st1202: fix pattern duration prescaler and pattern_clear skip
    marker
  leds: st1202: set all pattern PWM slots to full after clearing pattern
  leds: st1202: fix spurious pattern sequence start in setup
  leds: st1202: fix brightness having no effect while pattern mode is
    active
  leds: st1202: disable channel when brightness is set to zero
  leds: st1202: validate LED reg property against channel count
  leds: st1202: correct and extend hw_pattern documentation

 Documentation/leds/leds-st1202.rst |   9 ++-
 drivers/leds/leds-st1202.c         | 102 ++++++++++++++++++-----------
 2 files changed, 67 insertions(+), 44 deletions(-)

-- 
2.55.0


