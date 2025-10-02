Return-Path: <linux-leds+bounces-5637-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67227BB4E77
	for <lists+linux-leds@lfdr.de>; Thu, 02 Oct 2025 20:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9AAB19C7074
	for <lists+linux-leds@lfdr.de>; Thu,  2 Oct 2025 18:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438F72797AF;
	Thu,  2 Oct 2025 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QmzMa31x"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87782522A7;
	Thu,  2 Oct 2025 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759430498; cv=none; b=Hj6bxgeLxIgKojt4ZFywTszcp2uNYLuvxn9rKIMlbNMltJCqTyupcfX2WSW8PWv33e4U1BtOzZTF7aU0i8c+0JNH66PVXiVbtuV6OACjcci9AmS2vn8rCxBdj3w911YAKuYQAAcwCsRcU/VYTR1vLDTxjchWRUM+dDtW3FaBies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759430498; c=relaxed/simple;
	bh=38x6AKKhMCqYWAyIrq9fM4S2SrttbAFJn7J0VLxadcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILJyDXKrlKug04II7vANh0S7ud1zkTBPXwDXQJeU+0Bxws5NdIj0q+XpzVYZn+nytpxaXmiCnMjoW0vA5xdf+cUgo5LV0PhvI7kUC9s6YqSucwKI6zJ+vuGCdwMg0kSvwO6LF2+ju2mXdmPw7AlnifDLOaKpMywZHv4LwpgaAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QmzMa31x; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759430486; x=1760035286; i=w_armin@gmx.de;
	bh=ER0uR/OcDkZmP8lQS64ScT4FqoM5Kof4As58KL6QTrY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QmzMa31x6yv5nclKjXhrG7LVeaCHv/fWYq2nrbc7nSp5y9r7MdiTfyaCSgkhzYaK
	 tHa82pPs4eJS/R/eKE99h/cOZokeBXpvylPoTcGUmzYIjstg+BhVqQd8haGgy0Sp4
	 zdx9Te2qpGKV3f40CxwDFvQtU9/iw4cWPEIUeaN5T6Ur0XO0KpYhWGqLWwqKblQmg
	 ADPtPTFZsp0C6gBr6Yxrk5Neoei9rMLSYDjGxKfkVn7QjgWcjIxYzVUR2dFagXlzq
	 e1T1vkhSA/fPYw1fMdfDl8P0NyilQX9yAcKkd8VoAyDcHek/dtrw765h7NF4weBQJ
	 L8g8UDk77CV2SU9LVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([5.61.150.13]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QF5-1v3YlH2OJR-005lA6; Thu, 02
 Oct 2025 20:41:26 +0200
Message-ID: <6146d57b-f855-40b1-a644-3af6b28ceea4@gmx.de>
Date: Thu, 2 Oct 2025 20:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
To: kernel test robot <lkp@intel.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com
References: <20250928013253.10869-2-W_Armin@gmx.de>
 <202509290415.uez00SgW-lkp@intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <202509290415.uez00SgW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pJL4JX560v0XtqxAXOnu6TvOrTXP1X/3lUHczu4a3ls0MPXTFQ5
 Dre4o31rmfZYUU9ozAan5Xvy3fbOz95sejZVaqFLlRPXDK84mMPmp4mWj4L1m3LDbjnJ/Dm
 aDSh4jsfT4k9PIQgeIhUygW8pKAUeB+L6QwtE8p71+4NIDf4tvcQhNBa8ccRwLgSq1Jxf9K
 qHH6+sMxbwzQ+l2z6TwCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QQtR82DAsdA=;MxJX4WU11oVyMbSePVMssa93PVv
 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
 Jo19ZGLmmnQsN/NYex3nhIj8+8sMYkxYK1oht9

Am 28.09.25 um 22:42 schrieb kernel test robot:

> Hi Armin,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v6.17-rc7 next-20250926]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Armin-Wolf/platfo=
rm-x86-Add-Uniwill-laptop-driver/20250928-093543
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/20250928013253.10869-2-W_Armin%=
40gmx.de
> patch subject: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/202=
50929/202509290415.uez00SgW-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f=
0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arch=
ive/20250929/202509290415.uez00SgW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509290415.uez00SgW-lk=
p@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/platform/x86/uniwill/uniwill-acpi.c:1243:3: warning: label fol=
lowed by a declaration is a C23 extension [-Wc23-extensions]
>      1243 |                 guard(mutex)(&data->battery_lock);
>           |                 ^
>     include/linux/cleanup.h:401:2: note: expanded from macro 'guard'
>       401 |         CLASS(_name, __UNIQUE_ID(guard))
>           |         ^
>     include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
>       290 |         class_##_name##_t var __cleanup(class_##_name##_dest=
ructor) =3D   \
>           |         ^
>     <scratch space>:49:1: note: expanded from here
>        49 | class_mutex_t
>           | ^
>     drivers/platform/x86/uniwill/uniwill-acpi.c:1250:3: warning: label f=
ollowed by a declaration is a C23 extension [-Wc23-extensions]
>      1250 |                 guard(mutex)(&data->input_lock);
>           |                 ^
>     include/linux/cleanup.h:401:2: note: expanded from macro 'guard'
>       401 |         CLASS(_name, __UNIQUE_ID(guard))
>           |         ^
>     include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
>       290 |         class_##_name##_t var __cleanup(class_##_name##_dest=
ructor) =3D   \
>           |         ^
>     <scratch space>:60:1: note: expanded from here
>        60 | class_mutex_t
>           | ^
>     drivers/platform/x86/uniwill/uniwill-acpi.c:1249:2: error: cannot ju=
mp from switch statement to this case label
>      1249 |         default:
>           |         ^
>     drivers/platform/x86/uniwill/uniwill-acpi.c:1243:3: note: jump bypas=
ses initialization of variable with __attribute__((cleanup))
>      1243 |                 guard(mutex)(&data->battery_lock);
>           |                 ^
>     include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
>       401 |         CLASS(_name, __UNIQUE_ID(guard))
>           |                      ^
>     include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE=
_ID'
>       166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, pr=
efix), __COUNTER__)
>           |                             ^
>     include/linux/compiler_types.h:84:22: note: expanded from macro '__P=
ASTE'
>        84 | #define __PASTE(a,b) ___PASTE(a,b)
>           |                      ^
>     include/linux/compiler_types.h:83:23: note: expanded from macro '___=
PASTE'
>        83 | #define ___PASTE(a,b) a##b
>           |                       ^
>     <scratch space>:47:1: note: expanded from here
>        47 | __UNIQUE_ID_guard1072
>           | ^
>     2 warnings and 1 error generated.
>
Hi,

i think this is a problem inside the clang compiler. I did not encounter t=
his warning when
build for x86-64 using gcc.

Thanks,
Armin Wolf

> vim +1243 drivers/platform/x86/uniwill/uniwill-acpi.c
>
>    1235=09
>    1236	static int uniwill_notifier_call(struct notifier_block *nb, unsi=
gned long action, void *dummy)
>    1237	{
>    1238		struct uniwill_data *data =3D container_of(nb, struct uniwill_d=
ata, nb);
>    1239		struct uniwill_battery_entry *entry;
>    1240=09
>    1241		switch (action) {
>    1242		case UNIWILL_OSD_BATTERY_ALERT:
>> 1243			guard(mutex)(&data->battery_lock);
>    1244			list_for_each_entry(entry, &data->batteries, head) {
>    1245				power_supply_changed(entry->battery);
>    1246			}
>    1247=09
>    1248			return NOTIFY_OK;
>    1249		default:
>    1250			guard(mutex)(&data->input_lock);
>    1251			sparse_keymap_report_event(data->input_device, action, 1, true=
);
>    1252=09
>    1253			return NOTIFY_OK;
>    1254		}
>    1255	}
>    1256=09
>

