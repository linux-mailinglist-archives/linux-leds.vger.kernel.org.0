Return-Path: <linux-leds+bounces-7683-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLBmBUM82WkHnwgAu9opvQ
	(envelope-from <linux-leds+bounces-7683-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 20:06:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0CD3DB51C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 20:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13F1E300A58B
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 18:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E338B3E3C75;
	Fri, 10 Apr 2026 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA/+3+tT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD953E2765
	for <linux-leds@vger.kernel.org>; Fri, 10 Apr 2026 18:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844413; cv=none; b=h/CM2LE3PM+jB7oOvbqy6NUSpOZHKZad9hTlyynNVMdVrUBYfnFsDS3OP5kzjSBUWEMzWa9S6WqgmTq8uZvU2cX5y6tePRMu1fYGR2FlKTWd6As9aLh2amZMOmEq/uRC2l9xsZE5tVMMW+t9CVFWbg/XANe8sx1kw9WJVfts1o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844413; c=relaxed/simple;
	bh=3CjkFtx39rP31hEkB1VvDpu+tDzy2ozSCK7NQzcwwrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8aiyJbcs5hAYq55hlRvtpeB8C61wbu6xDTlS3Uus6d9aGU2QD7YsgaVYuc+pVtxXRj7eoAcKvlt02v7l8olcaFg+5Zadi7oVIBOFfxTGXAxrLS/K7mZihfxAOb4y3Hubn1VbXuUfS/ug2nmQgqRYZmeOQbrmyN9uacdbbDgtno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA/+3+tT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-670af4fc2f1so966982a12.1
        for <linux-leds@vger.kernel.org>; Fri, 10 Apr 2026 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775844411; x=1776449211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U668gXvxPD619cf6wEJKSOTDAXgasBKL3LEjdrNCUoM=;
        b=hA/+3+tTvFqo9HLwwPwReUKk/1MfC5DVVKEuK2Kx21oXkxPQSSrtOW4P5q3CGeCCHc
         zvlhrIDn6iXK402U2TUs2pkCE3DUdR+9fOSoGvxe7cdl7w8NzeO2va2GJV1svvFlc4SW
         TFJFHjd52GjRhAeJUTueu+RL4e5uKpXlBil3H1/L3yXgLOGqt06L/m2xdjhuPbW5AZg/
         zH0pdgjGdyGTEDlsAW8wo4KuQ2VQxdjmTS3PLJSPrQf8ZqjlI4j0D+0e+nYo/3p/KAAi
         AAaYsAiXqWc7q3bwECQmKEOEUO3WY6CKFNQPu15rvXcK4XOlqoZYyJJ9R0rZGs697jAw
         VFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775844411; x=1776449211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U668gXvxPD619cf6wEJKSOTDAXgasBKL3LEjdrNCUoM=;
        b=V/6ewXI8PoyAm5H6oKMKUfK6L4xpzOoda2dnQF4lQkiuMO03u/TOSK9hW7k36K/KhQ
         j7/VdxRgDSCEHNCZu3E7EIWSybTvpzUJAiHFI3OEm90Y1KtCT3S701/ls6UDH2oqyyXP
         QKOvAAphQBYRLErdzrlzTO7E7Kr2A8Iplu3Xpsh2IdtosmiUB7bQM/4JwQhsbR477vLq
         8MQTh917Xu7YRXNCH/244q+7BGQzuv8doncSFDkg7qDVF7jMX2nutfKcX7znaPJFB8U6
         P/Xq5K2B9htv5mp8YXBlVCAheorGzMxLzHyRWS+HqlkljvHPwoBcE+4jwB71cG422Mag
         pO1g==
X-Gm-Message-State: AOJu0Yy/SvoqX2hzOSkXulr8nZ0qqxwG0h3C4d46L0TwjEtrpPRT6gaU
	73/FOuloOW6AwyqhI+um5eVUE2/aTTN7zTN5XUnmKTssv2IOU1h/x1t1
X-Gm-Gg: AeBDietd6HXc8uwgyE8r7sQoBf7dEAUs32tdCSypW/YgXBub+nVsNYzh32AZ4IyC66e
	ZU/+BlJzMTyT4WtOq9zjL5UtWDHWmRIomi78s1dkPrb7rnwILRLc79xh/JR9QWuP42djYGuiAEd
	jpBgtGg8zaHTDtcKLlg+hINsc1ouk34AxVqBWFdqHfmp67fJuVm8gammKUPjO/679DfA4Qo7xkC
	d1sBJfezak4+u+E0fdX9zySg2tU3auMNnDwdZvHGL9MPNFPmvd5DTSOLMuhml/IJ+iRF0LZ4S6L
	tgSjQrQI8XTHbXbnZG7tzTRnZHO6ey97DW/tAHRgRruxp7ikEiSR+zj+IRLR+ZfL1JFV3ynMTra
	SETZIiAWwXQiRqbrtQGQJLk8Sb4T41Zqc4MUd2wfDQ/1W2EpESk3F7L2eAcW6BDkqaLcYaf9GcJ
	7522FU7GPCk/MZbIPWUVlcjRLJRInTNdyO2UWogYjKgbBSNw==
X-Received: by 2002:a05:6402:2789:b0:66e:d1e2:4162 with SMTP id 4fb4d7f45d1cf-6707a47f0bfmr1901666a12.13.1775844410392;
        Fri, 10 Apr 2026 11:06:50 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6707062530asm761560a12.19.2026.04.10.11.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 11:06:49 -0700 (PDT)
Message-ID: <47a2a9f3-bf9a-46a9-b361-c9022533da43@gmail.com>
Date: Fri, 10 Apr 2026 20:06:46 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-binding: leds: publish common bindings under dual
 license
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Corvin_K=C3=B6hne?=
 <c.koehne@beckhoff.com>, Ashley Towns <mail@ashleytowns.id.au>,
 Gergo Koteles <soyer@irl.hu>, INAGAKI Hiroshi <musashino.open@gmail.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Roderick Colenbrander <roderick@gaikai.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260408062942.7128-1-corvin.koehne@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260408062942.7128-1-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7683-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,beckhoff.com,ashleytowns.id.au,irl.hu,gmail.com,schinagl.nl,ucw.cz,milecki.pl,gaikai.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B0CD3DB51C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/26 8:29 AM, Corvin Köhne wrote:
> From: Corvin Köhne <c.koehne@beckhoff.com>
> 
> Changes leds/common.h DT binding header file to be published under GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to leds/common.h file in copy.
> 
> Cc: Ashley Towns <mail@ashleytowns.id.au>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Gergo Koteles <soyer@irl.hu>
> Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Olliver Schinagl <oliver@schinagl.nl>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Cc: Roderick Colenbrander <roderick@gaikai.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
> ---
>   include/dt-bindings/leds/common.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 4f017bea0123..b7bafbaf7df3 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
>   /*
>    * This header provides macros for the common LEDs device tree bindings.
>    *

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski


