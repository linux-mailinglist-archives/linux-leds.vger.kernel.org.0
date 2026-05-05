Return-Path: <linux-leds+bounces-8007-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PVZMCMO+mntIgMAu9opvQ
	(envelope-from <linux-leds+bounces-8007-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 17:34:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9154D0473
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 17:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B22A300F9F9
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638F8481FD2;
	Tue,  5 May 2026 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ULPnBneo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ua1-f99.google.com (mail-ua1-f99.google.com [209.85.222.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7DB39D6FA
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995290; cv=none; b=GV748l6SnlhP6eWxAjpEuwU6gTMMRWv5Fk5PBg8PCjtIW5bTqKERcV8xHAuIOV/0bg1uS07MkVRH0EQIe/E1zg0VgDR7ochN2REELWpYPng+fHzspk7MCY0MyRNUQAIsBygM3ub+6ZYIYLpJITNJJyM1yXAT/CwEzQmD2gThfkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995290; c=relaxed/simple;
	bh=g50FWd240XxxeHR0wZZltMJw7SH0rpOeuhOkFOG+fy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PZgYyHfwmCj4CWLFvxqRO2LmMGm+88lYUOWfRmXWhMfImvpTqNdA12YOo02+TfgRInq2jggcS4SQg2YDJ8iQuADwzz6C9/MGpVWu2xwiPhjaAaQjKWDC/TtztRznj1qKC5bHhwa+fyaBKWIMiVIAuqK5DMR90xjlkhN5YxHezMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ULPnBneo; arc=none smtp.client-ip=209.85.222.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ua1-f99.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso1374860241.0
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 08:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995287; x=1778600087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kA0xbWBKz7CEhEmimLuZzTtRlEkl5OY8Zl0ZAfchvHM=;
        b=tS8sboQA6L2oWVkUKzKX9VgnjZonAuE0bRBzYa+I08y4mVpyDNnt/kyCkr7vfHVShz
         hfjsq71yEbzDsuuyJK9zrilr9oH8pcp2eb14nIbFWYSL89aQpTrsNBamU1dP+tkOzjCj
         MmnAfis1F6ZEKNAbIG6e1Hluhzgd14I9FS5PLwyDv1G+MVCKLWnhELaDDnTjxYZwHUSZ
         Zo73QV8l0j9YBKE3iQOhQWKavxRGw5X6oJeKVhFpSB0yj7m36lheDSi4hwi8lj4qKrNq
         2Ri4zcpB3g5oH9p9/h5g224ixELMDPMzUSQPX8gVwoWpvNBpFzxeP5n1hrHkxhXY00rc
         yLeA==
X-Forwarded-Encrypted: i=1; AFNElJ/nJnaBApZXJcPPAPKDID53Qa1jSzZGreNwfiNk/5w+rThr4Wf9rVCwvKV0M99b1RMu6bRF40BRpLAe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv5maHivSR6HxehLldZhcpNL0SGZWoWb0gzwfHjM/QxNjP76mO
	32vg+6BJa9Lc4uV/W4yYFx1SN3zNP5gAhxLm96wt4ypfhMMvhDfBZa+G8RGW4gOpYM5dV1WtDk1
	T/YcwDgSV5Jfn0mxkHqxHx0gPulxCjj09R2KRqTxFv+yl76KmYatWOrdv34u8aJzg7+E3SxTh4n
	QGRrwEQJ147Ih/rWoIHYwkfLiafDIwj3qJcHXE6alZMlajogo0o40RsB4VfLp08ZHe9dHnx8+ek
	dbiSg/k93k+bxWSTyjaeg==
X-Gm-Gg: AeBDiet4H/FJ9odf57b9gonpNwuYDZ8ln2rSOKilfFQz1NqMOAQX5yX6gdGZrYUhpw1
	UYwp38mUY2UrxyH5juWGwVr/QlyNoSUexgZgOWfz7aODNze+szIBEqCe3SMCLc/yPbJx4Mbx+X9
	GkrWIG1Y4JWTfXiJY06KH7MZ9h6b71cySWSrkU5+YqjVuW24By6jWgamIhs6KuvsVDl6D+TmKOl
	LWho6J0eWOrrPDmTEdntav2y9/2NrAHjHe5ab0mPcjF4K2ZV6M837xkktUPCCdGnNKT2r0qcB3q
	heyPk+c4+K3XwsieE7+zWKvguMwX3AAXnGuSpnrBiRGbWRr2V6vSq7cTEqMD+nAcOGXvFAzlZhD
	/2PH3W7rJL+2DitsuYY3q6Geitq9av9VOVR7Q+KBWgK+nbBY4Cxm1SMHc8JT1LNZG41EpHXLoVG
	W/NCmIuAgptbdtplEKLR/2i+br0jXvBqAwuyVGRHB+YgbI3elW+TMcKbpMs58lRsnhEFkD7gc2
X-Received: by 2002:a05:6102:149c:b0:604:ec90:ba14 with SMTP id ada2fe7eead31-62d85697f2fmr7542404137.11.1777995287030;
        Tue, 05 May 2026 08:34:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-62f46bbc654sm376342137.15.2026.05.05.08.34.46
        for <linux-leds@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2026 08:34:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so7115269eec.1
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777995286; x=1778600086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kA0xbWBKz7CEhEmimLuZzTtRlEkl5OY8Zl0ZAfchvHM=;
        b=ULPnBneovLPsIe+Naua8d5UHN8jWZsR7DbQ7yxyjmC66Ag/SOH6r4TujUdLH2KflJd
         Xr/p0831FtheR5GmYXFZy+Hf3kN/XkDp3/3nxmnH+6LfGAvVeGh7FdanBGQHk6yhFnho
         c9ch4X0uqt64HqZYpw82QPlH6gSF+UvEg9ho8=
X-Forwarded-Encrypted: i=1; AFNElJ+T+avnuZY+QNCwDeSZ1O3wBcsackSc9g+rhBIIFp2kEX3UGlr2uJBpG7GBF7HNgIXcyIkYWKz/MZfq@vger.kernel.org
X-Received: by 2002:a05:7301:1001:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2efb78d70ccmr6578840eec.4.1777995285424;
        Tue, 05 May 2026 08:34:45 -0700 (PDT)
X-Received: by 2002:a05:7301:1001:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2efb78d70ccmr6578827eec.4.1777995284858;
        Tue, 05 May 2026 08:34:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm24306770eec.26.2026.05.05.08.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 08:34:43 -0700 (PDT)
Message-ID: <8f1380f4-6ef8-4fc8-b72e-4df7b6b3cbad@broadcom.com>
Date: Tue, 5 May 2026 08:34:41 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Queue-Id: 1E9154D0473
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-8007-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 03:28, 'Krzysztof Kozlowski' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/leds/blink/leds-bcm63138.c | 2 +-

For the above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

