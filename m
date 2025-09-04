Return-Path: <linux-leds+bounces-5382-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B6B4316F
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 06:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6B035E65B6
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 04:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2463522E3FA;
	Thu,  4 Sep 2025 04:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antonpaar.onmicrosoft.com header.i=@antonpaar.onmicrosoft.com header.b="hVd5vTUA"
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023075.outbound.protection.outlook.com [52.101.83.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71541BC3F;
	Thu,  4 Sep 2025 04:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756961935; cv=fail; b=Q10FFyq/MJ+rafEJNuwfdNaoo4KnThh6lZORTsuRlviSvYzoYpEpUJTXlp88A77Za5S8CzkbpfUVOWx+uKiz3sqV5dZkVIFkOxHDdOgPcMKoH7DLR+VrEuQ5WffGpZO0/TXNtf1xk30Ul2JodAkzvvrSWtOawlLhBddIryRPusI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756961935; c=relaxed/simple;
	bh=PYCzE2Of7JHJEJeWZRD3iFCwhcrULA+ZaaG7rMkKuqI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pUx+1l79smpfyrl1sgcVg8fUXJa/SKiMuV67U86sZ1xrmAWTPJi7QCS2joXaBjTQ6X3HhZ2hM20iyjLyJv06uEYp5VkN6Gv0wwf7GUVmPxg5mBWUBU7ycoanqy2ueIWoHBtxwWKZSPwVEF56dDfPVGaWTmUFWxqht8R53+UDbkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=anton-paar.com; spf=pass smtp.mailfrom=anton-paar.com; dkim=pass (1024-bit key) header.d=antonpaar.onmicrosoft.com header.i=@antonpaar.onmicrosoft.com header.b=hVd5vTUA; arc=fail smtp.client-ip=52.101.83.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=anton-paar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anton-paar.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THKSOPGAd4gUlatkfQoprZYiRo82nHKQ8i/dtY8d+XJPCX/lR99GeBdC9hUAs1z86NmxtpnMBRtDOyBwiU5SAOeDIOphmWhksI2ZQ2DHMBydfLvW2Kh5u+X1nzMgIX+GWzj3wpPjbQmsaiItWELcgBhgx8eBUhYjMupygueL40UoB5y4CcJOJno2oCfDEXpSxpdal7OTpXXhI7PQWFkmit6VJxmiFQbyUuFoiPtTDb1a8zrrl01VM5W6oFLMVscA7N3AnbQIIBMyZLUIc8Yordsf8MkriKvWwkEEI4gtsX05Se3uKqQed2dgvEufeoo9y3G/nKtoPUQty8rcQZtkWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOfLEB4tSbUJmqpP8gJCTXjHCKoXYXiQgX1xYNawghM=;
 b=ivcr+XZDURConAIkPvaA+IxVT3t3wa7/tyu63ugbVe8OClDV5qNOyNIxbvzXho4ezsXx5eGl+kAMmav0v2jE5V+Y4ounHzmJuzh935DoG2jZyZ0iMaZRwC/cgDVpMyJ472H9mtj1Je/jnNI1SxNOR/krxMD9qEWLZuwbeYLB9MuiyJ8D0ppmbVw0z8XA1K1zdovQezptenwXBKQ5hpK4PGlPSwfR3xWMsPjqxwZlGm/JfipReKx9hTQC41hhmZuhwIGg/xRoT1UbiJUAMstCds1HzFn1g5CALCPLluCv/wOo7u38NRokdKXpvajW6NjClGRhl7xX9tQymfbl0f41cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=anton-paar.com; dmarc=pass action=none
 header.from=anton-paar.com; dkim=pass header.d=anton-paar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=antonpaar.onmicrosoft.com; s=selector1-antonpaar-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOfLEB4tSbUJmqpP8gJCTXjHCKoXYXiQgX1xYNawghM=;
 b=hVd5vTUARJnFTEfzeKYkZe9WEQuSBa1+TAkJx4N0Ld5pQFHMS5iH4l+/yaad66fJanJaCmUP9lO5yOsbWIVJe0mqpBYLPFNohkBBVyL/AunyA5CH2oWJQiPpuA5jqj0C0nxqqnuOe0tQU4qmmCU21bPAeD27uG5JhLlptNOmNcY=
Received: from AS8PR03MB6901.eurprd03.prod.outlook.com (2603:10a6:20b:29e::8)
 by GV1PR03MB10274.eurprd03.prod.outlook.com (2603:10a6:150:165::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 04:58:46 +0000
Received: from AS8PR03MB6901.eurprd03.prod.outlook.com
 ([fe80::5201:2d7a:7316:9baf]) by AS8PR03MB6901.eurprd03.prod.outlook.com
 ([fe80::5201:2d7a:7316:9baf%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 04:58:45 +0000
From: "Lalaev, Andrei" <andrei.lalaev@anton-paar.com>
To: "rafael@kernel.org" <rafael@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "dakr@kernel.org" <dakr@kernel.org>,
	"russ.weight@linux.dev" <russ.weight@linux.dev>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Andrei Lalaev
	<andrey.lalaev@gmail.com>
Subject: use-after-free in firmware_fallback_sysfs
Thread-Topic: use-after-free in firmware_fallback_sysfs
Thread-Index: AQHcHVaYMLwG7S1dzkCwmnuOCex9SA==
Date: Thu, 4 Sep 2025 04:58:45 +0000
Message-ID:
 <AS8PR03MB690125FD99DEC3AF5887AE0DC800A@AS8PR03MB6901.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=anton-paar.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB6901:EE_|GV1PR03MB10274:EE_
x-ms-office365-filtering-correlation-id: 42774011-f167-4b53-01b2-08ddeb6fba6e
x-ms-reactions: disallow
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?C5O6Iop+AYEqwM4Lxu5GYncEWIxCMlbcb9TL+v7n/dB8GwiCAWoN0McYhr?=
 =?iso-8859-1?Q?lXHPvjwR1AOm9e8VOv0Wv4jDVXUK/ga9zP3T/W50BbDK4HRmIW2G3aBE57?=
 =?iso-8859-1?Q?C61ZbXUHkWQ4XKjQRHmK7STuk+qNWRDYAHp8pWEAIVAsTYN37GJZIOwTQg?=
 =?iso-8859-1?Q?6CnObb9n3ZF0oLysneG7qYpY4JDMHBRx7LVYjiXdVtDHBCp5JZw9kgqq5B?=
 =?iso-8859-1?Q?PAtppWitghmDryioiZ0ydBn3KnWo+SOFTb1sS7NtiE5cmLoFdh1xjaO3hu?=
 =?iso-8859-1?Q?+u5D0wZ1HUYI+tN28mKfhdPAvRK3qraWav8O4eNcja0FMMyibif8gf/TXw?=
 =?iso-8859-1?Q?xai5uyn9qZs5kfRccBN7kIWA+XStJG1ypseI5638sZm9ANJ+ih/QIH8aY4?=
 =?iso-8859-1?Q?QyhQaglDR8lN7Ssy8qSYE5PnTkPq3yjFUIs6nxTi3OzbFELHv72ZSk/Wf5?=
 =?iso-8859-1?Q?1MdDtYc67q9llHojDaPXXelGEunmLZr51L8b9vAiIscmUhNiblGUU+tJNT?=
 =?iso-8859-1?Q?MiB5CG/Vt6hhJLcTCH8oMA+08S4vjzTbfqtn3H7Ac2BYDDmKEMNBaEM/tw?=
 =?iso-8859-1?Q?Jq2c9LgkLKqXEPYO0oQZwnzWoJH3e2cbLCf3YXWZTRdW36FZ7QkAA9tC4p?=
 =?iso-8859-1?Q?rqKIWNh04V7dC1L7WKnN3Cw474bZiU0HE1NylRr8iTC9X6IXIVa1Y2JhCS?=
 =?iso-8859-1?Q?iCkinCuG6cZTYhF6BQKQeTs2bv04k2KG3pT5oD2dPUGAXpSI0JiTvM32/D?=
 =?iso-8859-1?Q?Pw4rhfB1cZJt63YEV0IHBK28H5v+MOLJs0Tob4Gcct2g3KubxDmB3z8yXt?=
 =?iso-8859-1?Q?oLF0d8v9KWleX298J8Tu00AiEt3ggM+iWAWQXdd2MwY9Z6bQZd+gjPPjKE?=
 =?iso-8859-1?Q?Jwz0a/jircgkjxUSqvIDGa3AzNonWeul5vwpZDz96LYZ1TtQg37CZ2Q3WE?=
 =?iso-8859-1?Q?sBRNbeO+4LOoU1P7y5SffyXkD+QYwd/KLHuDQoUF6UDoNoRIDfKoULqTpt?=
 =?iso-8859-1?Q?ziwBvaU0MpCe7ylPFN7pcsBaxNmslnhjEY4mdcwkovUYK7F7RbT4HL5XLn?=
 =?iso-8859-1?Q?ZVKlN/X2CceU6+tGIhOJidmLXPeRhAnv0MPE4dEppF/QXOXABdd4uei6lc?=
 =?iso-8859-1?Q?YjbkdMP71ATYFM9KmmluaYZDCcXzaUWTCZqkskUO+ZsBgfpTao2AjNI07d?=
 =?iso-8859-1?Q?NqsOeZSWwpcIsrrXGczlcA25CdDW6Cf/YGhb+yCdEuc11VIfeMUoZJLAwA?=
 =?iso-8859-1?Q?lILT9ncSYBXCvPkAgQi5ncDHmLS+d2G4pQA7AtMFSakHPKOBjaKC2rffwB?=
 =?iso-8859-1?Q?jrDGTH6SMDdHtkqf6nt9oADw6pFZeJ5R4mjQ4iEIBCxUsxE7mG+gGgETjU?=
 =?iso-8859-1?Q?NcRSe6rfv1MwT2LagE5DeqxfjK11CIKFAwGYFe6gV/h7NmjiC8IH7AttCr?=
 =?iso-8859-1?Q?qb7mny07DIPzAmsDxaL/Gzw5jaen5Nkr6JFzrUB0EbpBYeb+PjvUeclg/Q?=
 =?iso-8859-1?Q?iLDPh4y033DfOUtcoPYCPPLXIQwcovvycbnHc5lgLnkg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6901.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HuA/cKcYmCUxYvP7xW7A2U3NICESODsTBnDu1vi8ooKgTxl2gbjDVgD5oP?=
 =?iso-8859-1?Q?G+FYbHG3hDjRY55mRHrQjHalup5DghH7/x1ktN8C8pFlmIHNRgBE/DUhkx?=
 =?iso-8859-1?Q?iTUVOslwibeCuO/Wv8T0J1nW+T41n1P5O4gTPrZT+2tck+WX1RPphimQ7V?=
 =?iso-8859-1?Q?3hCWJvuJrM4Vg2iZqcN0qZLhS0YlfKdzHzsC5a3XqipxrqHFlKPszt5KKu?=
 =?iso-8859-1?Q?Fb263d5sfvSfVbcZPC8tPeiBmVm9Ac22SZ4fNIK/0mH95Es3Ir9CxVeRjW?=
 =?iso-8859-1?Q?smFC2wmj2qfpgynLAgIoc4GOyspxr2NmqLAQBQfzJyR9oMJeiLrCA5snTf?=
 =?iso-8859-1?Q?wjv7DC+dI549t7NpYrDzzPwKBpzY7RfQ9qf3brCJv04EiyHi1/pqMOTJo+?=
 =?iso-8859-1?Q?JXrOfY5PSb7KLMcHWsCGYmQTHH5dgr/zE399jzHwuwVHs1G9cec9jVv45/?=
 =?iso-8859-1?Q?BTMoRPaZQrrHa4U9g5aDKlRb974e9MKY9S/2JXCBB8Vrp9YsaVSQSl5G5I?=
 =?iso-8859-1?Q?DA0S32GFpt+gR/z+Y0NzjSV870Wynnm7IK49DVep612LBhNSyVYWUP/GVD?=
 =?iso-8859-1?Q?bwtjGrXIL+O3YeCelhv3jvasdd6TWyHhhLUfjd/DAht2XfT0uo2uzgHU1w?=
 =?iso-8859-1?Q?2wW1T6SMTpS4Cnv7oOKXqAMyJAIq9Cq17hfCELyeF1oBhj1rwIYL4QrOaV?=
 =?iso-8859-1?Q?6/BaRQKQb0tNuz8AFdLCJe7s+2cZIydUPoDFRiMdIisn/6E2OFOP6R8pWO?=
 =?iso-8859-1?Q?XU5YA2Lcf07G+VMW0dVzKCSDBt7pV2+R81AgmE7yHqhPFi7Ap9uBpCO2h3?=
 =?iso-8859-1?Q?DRW+P7hRdvbpuMnD+zXWEMx9JeCC7Ktfvut7lHEyIueu4uzAV9An1xLdnF?=
 =?iso-8859-1?Q?pp3Gf/LkMDGLrWTUn6PbM+j/RMiDbKbV2eZR6ImEgCweORd5fdnT1bisQv?=
 =?iso-8859-1?Q?5LjgY/aGK4RKVYXD5qxckOIgA+3AmTEgC0c7U0l/dholztD+WDxXGzeriU?=
 =?iso-8859-1?Q?lnPE9/pQM3xrXKgCdUkj36WaB5mS78SkGJc9rlLizbIB/Iqwnr1xyzEiNb?=
 =?iso-8859-1?Q?vlykmm9OPcQyNsU78QkzavdQeUrblqW3X4//D/sJZPwgHC26LXJtYw7Mjm?=
 =?iso-8859-1?Q?O72Zhygn92olTOM/8f4wv/B4zsGA/lXX63pV9qD8jMWmc97t4k6pfKsGxy?=
 =?iso-8859-1?Q?zGpzyOHtYvSAATWnrmU34YH5yHc7zMLr7p8SyGGBGyvKvV1qJ4ua0SM8cG?=
 =?iso-8859-1?Q?twV7gaM8yQ0kKJGg9gaTaefMk6KUmYOqoUQp2muymix2+a1a5LyDOQL8tH?=
 =?iso-8859-1?Q?w/oNY9FJOL9pjchOVLYDSIu75RG0kq7p8bFy11YiNod02ib/UkCncfDei+?=
 =?iso-8859-1?Q?fUbK6ZsCzBASfCbFL4PH+sY+O4UaEDhFbeRcu+1G+YWHjEs2x+/BTphcyr?=
 =?iso-8859-1?Q?Uu8l2Mg0d3R2p7lK7L5JivGhNljrmO4AdShYOlhZuLG5v8UjQZrVXwkh5g?=
 =?iso-8859-1?Q?BFsCMogyxjGDawEtiU2jt92b6/g2zlVQuMF+7yhUKHiUhf6AGJ7D5LwE0x?=
 =?iso-8859-1?Q?K4KwZEkrMHThoAuNrDhjjsuOJt2seznzdeW3XMzW41EYIoqG1VGVjE6uxx?=
 =?iso-8859-1?Q?GFkuoENB2t3xcBDsS57mviEhpNTpqgYIIc4Be1j8ijOoGibYEtEIR95A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: anton-paar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6901.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42774011-f167-4b53-01b2-08ddeb6fba6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 04:58:45.7738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1650d056-0824-4040-8341-61f3c6069bbd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXW33e2HwicRhZsUcyK5Z+foHsRWQpGqfXOx2SdMKz7/JV3r8Js63YT5ZEsWXOY3DQmuSsFS/EjjyaU0GFwth4FEc+BE/FbY1tQaw0oUTWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10274

Hi,=0A=
=0A=
We performed a long-term stability test on the LP5562 driver by repeatedly=
=0A=
downloading different LED firmwares using sysfs interface.=0A=
And after some time, we see the following "use-after-free" trace on kernel =
6.12.11:=0A=
=0A=
[  274.759115] BUG: KASAN: slab-use-after-free in firmware_fallback_sysfs (=
include/linux/list.h:153 include/linux/list.h:169 drivers/base/firmware_loa=
der/fallback.c:98 drivers/base/firmware_loader/fallback.c:162 drivers/base/=
firmware_loader/fallback.c:238)=0A=
[  274.766743] Write of size 4 at addr b31d0850 by task kworker/2:2/137=0A=
[  274.774680] CPU: 2 UID: 0 PID: 137 Comm: kworker/2:2 Tainted: G         =
C         6.12.11 #1=0A=
[  274.783208] Tainted: [C]=3DCRAP=0A=
[  274.786215] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)=
=0A=
[  274.792775] Workqueue: events request_firmware_work_func=0A=
[  274.798151] Call trace:=0A=
[  274.800720] dump_backtrace from show_stack (arch/arm/kernel/traps.c:259)=
=0A=
[  274.805827]  r7:600f0093 r6:600f0093 r5:b19659b4 r4:00000000=0A=
[  274.811510] show_stack from dump_stack_lvl (lib/dump_stack.c:122)=0A=
[  274.816613] dump_stack_lvl from print_report (mm/kasan/report.c:378 mm/k=
asan/report.c:488)=0A=
[  274.822073]  r7:000031d0 r6:df7dba00 r5:f13bbb20 r4:b31d0850=0A=
[  274.827755] print_report from kasan_report (mm/kasan/report.c:603)=0A=
[  274.832885]  r10:b2d56c20 r9:cdc89808 r8:00003a98 r7:b0f653ac r6:0000000=
4 r5:00000001=0A=
[  274.840744]  r4:b31d0850=0A=
[  274.843298] kasan_report from __asan_report_store4_noabort (mm/kasan/rep=
ort_generic.c:385)=0A=
[  274.849804]  r7:b9f72c00 r6:cdc89800 r5:b5d31e00 r4:b5d31e10=0A=
[  274.855488] __asan_report_store4_noabort from firmware_fallback_sysfs (i=
nclude/linux/list.h:153 include/linux/list.h:169 drivers/base/firmware_load=
er/fallback.c:98 drivers/base/firmware_loader/fallback.c:162 drivers/base/f=
irmware_loader/fallback.c:238)=0A=
[  274.863105] firmware_fallback_sysfs from _request_firmware (drivers/base=
/firmware_loader/main.c:941)=0A=
[  274.869862]  r10:f13bbda0 r9:b9f72c80 r8:b19c73d8 r7:00000004 r6:0000000=
0 r5:b5d31e00=0A=
[  274.877718]  r4:f13bbd00=0A=
[  274.880273] _request_firmware from request_firmware_work_func (drivers/b=
ase/firmware_loader/main.c:1196)=0A=
[  274.887226]  r10:b9f72e98 r9:b9f72e94 r8:f13bbde0 r7:173ee5d3 r6:0000000=
0 r5:ad2777b0=0A=
[  274.895097]  r4:b9f72e80=0A=
[  274.897661] request_firmware_work_func from process_one_work (kernel/wor=
kqueue.c:3235)=0A=
[  274.904613]  r10:00000000 r9:b7d7e1e0 r8:b7d7dd80 r7:d76b53c0 r6:b2013c0=
0 r5:b9f72e80=0A=
[  274.912469]  r4:b2371a00=0A=
[  274.915024] process_one_work from worker_thread (kernel/workqueue.c:3304=
 (discriminator 2) kernel/workqueue.c:3391 (discriminator 2))=0A=
[  274.920823]  r10:b2371a2c r9:b2371a00 r8:b9f72e84 r7:b2371a2c r6:d76b53d=
c r5:a546e345=0A=
[  274.928678]  r4:00000007=0A=
[  274.931234] worker_thread from kthread (kernel/kthread.c:389)=0A=
[  274.936179]  r10:f0933ca0 r9:b2371a00 r8:b7f6b800 r7:b019ad18 r6:b235488=
0 r5:b7d7dd80=0A=
[  274.944035]  r4:b2354d00=0A=
[  274.946592] kthread from ret_from_fork (arch/arm/kernel/entry-common.S:1=
38)=0A=
[  274.951350] Exception stack(0xf13bbfb0 to 0xf13bbff8)=0A=
[  274.956435] bfa0:                                     00000000 00000000 =
00000000 00000000=0A=
[  274.964647] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000=0A=
[  274.972858] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000=
=0A=
[  274.979508]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:0000000=
0 r5:b01ba280=0A=
[  274.987365]  r4:b2354d00 r3:00000000=0A=
=0A=
[  274.992472] Allocated by task 8 on cpu 0 at 273.209883s:=0A=
[  274.997814] kasan_save_track (mm/kasan/common.c:48 mm/kasan/common.c:68)=
=0A=
[  274.997858] kasan_save_alloc_info (mm/kasan/generic.c:566)=0A=
[  274.997892] __kasan_kmalloc (mm/kasan/common.c:398)=0A=
[  274.997926] __kmalloc_cache_noprof (mm/slub.c:4319)=0A=
[  274.997957] alloc_lookup_fw_priv (drivers/base/firmware_loader/main.c:13=
1 drivers/base/firmware_loader/main.c:190)=0A=
[  274.997993] _request_firmware (drivers/base/firmware_loader/main.c:769 d=
rivers/base/firmware_loader/main.c:899)=0A=
[  274.998023] request_firmware_work_func (drivers/base/firmware_loader/mai=
n.c:1196)=0A=
[  274.998055] process_one_work (kernel/workqueue.c:3235)=0A=
[  274.998084] worker_thread (kernel/workqueue.c:3304 (discriminator 2) ker=
nel/workqueue.c:3391 (discriminator 2))=0A=
[  274.998112] kthread (kernel/kthread.c:389)=0A=
[  274.998149] ret_from_fork (arch/arm/kernel/entry-common.S:138)=0A=
=0A=
[  274.999686] Freed by task 8 on cpu 0 at 273.230581s:=0A=
[  275.004679] kasan_save_track (mm/kasan/common.c:48 mm/kasan/common.c:68)=
=0A=
[  275.004718] kasan_save_free_info (mm/kasan/generic.c:582 (discriminator =
1))=0A=
[  275.004747] __kasan_slab_free (mm/kasan/common.c:271)=0A=
[  275.004782] kfree (mm/slub.c:4601 (discriminator 3) mm/slub.c:4749 (disc=
riminator 3))=0A=
[  275.004810] free_fw_priv (drivers/base/firmware_loader/main.c:231)=0A=
[  275.004840] release_firmware (drivers/base/firmware_loader/main.c:604 dr=
ivers/base/firmware_loader/main.c:1170 drivers/base/firmware_loader/main.c:=
1166)=0A=
[  275.004871] lp55xx_firmware_loaded (drivers/leds/leds-lp55xx-common.c:54=
9) leds_lp55xx_common=0A=
[  275.005074] request_firmware_work_func (drivers/base/firmware_loader/mai=
n.c:1197)=0A=
[  275.005112] process_one_work (kernel/workqueue.c:3235)=0A=
[  275.005145] worker_thread (kernel/workqueue.c:3304 (discriminator 2) ker=
nel/workqueue.c:3391 (discriminator 2))=0A=
[  275.005174] kthread (kernel/kthread.c:389)=0A=
[  275.005212] ret_from_fork (arch/arm/kernel/entry-common.S:138)=0A=
[  275.006754] The buggy address belongs to the object at b31d0800 which be=
longs to the cache kmalloc-128 of size 128=0A=
[  275.018610] The buggy address is located 80 bytes inside of freed 128-by=
te region [b31d0800, b31d0880)=0A=
[  275.030938] The buggy address belongs to the physical page:=0A=
[  275.036533] page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0=
x131d0=0A=
[  275.036568] flags: 0x0(zone=3D0)=0A=
[  275.036598] page_type: f5(slab)=0A=
[  275.036634] raw: 00000000 b2001400 df9544e0 00000002 00000000 00100010 f=
5000000 00000001=0A=
[  275.036659] page dumped because: kasan: bad access detected=0A=
=0A=
[  275.038189] Memory state around the buggy address:=0A=
[  275.043008]  b31d0700: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=
=0A=
[  275.049563]  b31d0780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc=
=0A=
[  275.056120] >b31d0800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=
=0A=
[  275.062669]                                          ^=0A=
[  275.067831]  b31d0880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc=
=0A=
[  275.074386]  b31d0900: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc=
=0A=
[  275.080938] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
I couldn't find any related patches to fix this issue in upstream, so=0A=
I have made the following patch to address this issue, but I have some conc=
erns about it.=0A=
=0A=
Could someone please provide feedback or insights on this?=0A=
=0A=
----=0A=
 drivers/base/firmware_loader/main.c | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_lo=
ader/main.c=0A=
index c6664a787..1a49022f4 100644=0A=
--- a/drivers/base/firmware_loader/main.c=0A=
+++ b/drivers/base/firmware_loader/main.c=0A=
@@ -211,6 +211,7 @@ static void __free_fw_priv(struct kref *ref)=0A=
 		 (unsigned int)fw_priv->size);=0A=
 =0A=
 	list_del(&fw_priv->list);=0A=
+	list_del(&fw_priv->pending_list);=0A=
 	spin_unlock(&fwc->lock);=0A=
 =0A=
 	if (fw_is_paged_buf(fw_priv))=0A=
----=0A=
=0A=
=0A=
Thanks a lot!=0A=
=0A=
Best regards,=0A=
Andrei Lalaev=

