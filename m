Return-Path: <linux-leds+bounces-7387-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAy8M1XyumkBdQIAu9opvQ
	(envelope-from <linux-leds+bounces-7387-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 19:43:33 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 333F02C17FF
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 19:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CB4F301A382
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 18:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079E93E1208;
	Wed, 18 Mar 2026 18:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVNAOC3L"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712E3DFC85
	for <linux-leds@vger.kernel.org>; Wed, 18 Mar 2026 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773859171; cv=none; b=PcA1bIgkFdAryEBM+OjbTjS2OoGpzzeVy+dRyr6FGywV+Y6a42LhCn3SiRRunFoaXWM6u24u7kb5YQiNZUvQxiVwy4ZdTaSizNp6c64kHxJ5IbBla9YDQKLm2CWFietMep9HBjLf7BmtT5eZQtmQbTH/m1Ajg/EXA9aOlFsQGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773859171; c=relaxed/simple;
	bh=OhK95wo/LYj7R7tzUElFwcUK2IiZRunuZ2g5LeCSFgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBPLG7CpgnPSfLVeJFGYZOHaWVd+0a62dq4BmedIvqT6hbIKFo3MrCWZIF83EJ0vRxLU9YnHzWNmnxlqE2eCVn3XHe3ucCMJl6emTx0zF9kC1Qq9I7Eb3YVUxutlaAHDgjOQbPcS6yMzxWSu8l8PWdDN5r3YDWvaygqYW7D9cHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVNAOC3L; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4e9694so482423c88.1
        for <linux-leds@vger.kernel.org>; Wed, 18 Mar 2026 11:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773859170; x=1774463970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15qwLCeSSBieP/miy+9XAN8j6MaIvEBFpVF+G71Ltsk=;
        b=bVNAOC3LMkaSUxzdQkPMaC6DqNNji7u439ThmPbwIepGZhL6MeiLrWp06HYXC9dfAf
         uV5X2rOL2mAwBwSlxRMWj7O3nhpBzrbaRMZWNd5PArmLRn4ZRAaih1WHptqFsKvJDtZi
         GjwSmJ8HHCzUzSADP2syuJgdVNLi+l1PgW+XUtRSaGF/3PCe7gm4ty5ieiPWpMG9NyFp
         UOiD7OZp0mucNBpPz7Q1E0x+BCyqtbxsUjpNwn9jrpnvQaiEXRWDlQLX7tonBiDBb7DH
         B983bP7ind2F94qIAgfCb1Fx3QtrdrYWl09H+pkKw9xaw4m8Iee7wJtgiVsw/EB2H9eB
         49ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773859170; x=1774463970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15qwLCeSSBieP/miy+9XAN8j6MaIvEBFpVF+G71Ltsk=;
        b=FAISW90tW0LvppMryp7Mod90rdBitTuRes0nRTROM8ZtinV24S8jnbTckZGuDBfou7
         KpG09ftB7DabhavLuQCRARHN9rq9/w++m7mq+1ZG2cxB9HJptCMn7qhhsIeRJ2rqzyrF
         t9hG2y/Nmz578NoqeqyWtsn0rdMy6IxaosPGwF9ldzds3Z5jGD6vjMTuGKTFQkSXZ1+f
         LKbPJQUJnG4uHCsk0UBK+1VF4ivY8IDtkHXLZvzybCqh+910trkh1yAn2SIu1QR/NuRb
         XUOv6H/Qh8XrbebYpgopQLL13zwSeoO/PSQg176KI1++qJ7Rh1r+zzLV1qtv5Ax4or/F
         9CdQ==
X-Gm-Message-State: AOJu0Yxgn69iXw9Wx4Ud/wSTzwQNbOYcuze+jqNs1ff+DTQ4R+okF8mB
	knRe6v7KsdkXGBAWHvQB8FFmdMoS08TODrKBf1dVrCSrJb7KbGe23Ul2
X-Gm-Gg: ATEYQzwHHFSMDsdY6118D75G2RXLA0kh/SJQ7rTPVBbm2gONMYvWsFYXPoDiHlXEu5o
	iRASOjRN98/SgPAQoq8jgQypCxBQzHa2o4PDE1FKS3DL/1o6Q2PALh3lF4vGdTMMdrs8yrOnHl3
	9WgLl+LBt2vE+LZ0DmI1F4Xo5tVgW2IyPvLJv69bbH+kTVeCHmfbFwJ/Nqnm9U/QdssGRM3TACc
	DWC6uNYGwjXGq6km8u1Y8eRvObHPijf9VAwhJdqmJmKRKu5iM+hcECBkrkhRvWSMNtn+X1oo89a
	gXhJzcPjFSkFWYjvuQYL24kZDHVUgDyWKan5PILPiAwVNw97Sgpt6Ea2A0QjCEpKkpjEyeeGB+x
	KOqV8D/OeK1FdCR4T1b7UXcQYcNi/SguGpyxmPiUc0qMgyW75cdcGJqz6MPjPB0cJAg9Pi7xqHz
	56XGVQeabmmBmH56GJYPM6OmddEiByjcwUZ8+lQ9tODJNOBUvDB2gzI+G5x/jpLkYsPtEPi9IoP
	ALl6Q==
X-Received: by 2002:a05:7022:2507:b0:11a:3483:4a87 with SMTP id a92af1059eb24-129a70e09ddmr2437571c88.13.1773859169868;
        Wed, 18 Mar 2026 11:39:29 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a72562bcsm4285798c88.5.2026.03.18.11.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:39:29 -0700 (PDT)
Message-ID: <39226c91-a7a7-4f9e-a10f-4c3ddafeb432@gmail.com>
Date: Wed, 18 Mar 2026 11:39:28 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera flash
To: David Heidelberg <david@ixit.cz>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
 <20260306-expressatt_camera_flash-v1-3-b1996f7cdfdd@gmail.com>
 <b2cbd264-55c8-4dda-9545-fa79ce6517c6@ixit.cz>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <b2cbd264-55c8-4dda-9545-fa79ce6517c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	URIBL_MULTI_FAIL(0.00)[ixit.cz:server fail,sea.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7387-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 333F02C17FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/7/26 00:23, David Heidelberg wrote:
> On 07/03/2026 01:58, Rudraksha Gupta via B4 Relay wrote:
>> From: Rudraksha Gupta <guptarud@gmail.com>
>>
>> Add camera flash support for the Samsung Galaxy Express (expressatt).
>>
>> The flash IC uses a one-wire pulse-count protocol on GPIO 3, gated by
>> PMIC MPP 4 which must be driven high to unlock the flash circuit.
>>
>> Downstream references:
>> Link: 
>> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
>> Link: 
>> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
>>
>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>> ---
>>   .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 31 
>> ++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git 
>> a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts 
>> b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
>> index c4b98af6955d..96460775a4ec 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>>   #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>>     #include "qcom-msm8960.dtsi"
>> @@ -61,6 +62,20 @@ touchkey_enable: touchkey-enable {
>>           regulator-boot-on;
>>       };
>>   +    camera_flash: led-controller {
>> +        compatible = "richtek,rt8515";
>> +        enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
>> +        unlock-gpios = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&cam_flash_en>;
>> +
>
> LGTM, just please order pinctrl-n before pinctrl-names :)
>
> Reviewed-by: David Heidelberg <david@ixit.cz>
>
> Nitpick: if you can, add phone-devel@vger.kernel.org for next time,
> it's easier to distinguish the phone patches in huge linux-arm-msm 
> pile :)

Hello David,

Thanks for your comments! I have addressed them in v2 :)

Rudraksha


>
> David
>

