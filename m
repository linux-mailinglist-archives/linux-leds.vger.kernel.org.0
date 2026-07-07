Return-Path: <linux-leds+bounces-8950-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id keefOfr5TGqhswEAu9opvQ
	(envelope-from <linux-leds+bounces-8950-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Jul 2026 15:07:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2D71BAF6
	for <lists+linux-leds@lfdr.de>; Tue, 07 Jul 2026 15:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JGUU9pe7;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8950-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8950-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13CF130F5805
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jul 2026 13:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C436F380FFB;
	Tue,  7 Jul 2026 13:00:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7509B3E7BB6
	for <linux-leds@vger.kernel.org>; Tue,  7 Jul 2026 13:00:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429239; cv=none; b=mPTIIRdDc9uIPmnn2mtSbC2OyaxGlIugVpi9vfreROn+aLy51ttahJ5sf03Sma/Od+DVlUqVC59l5Ai9R86Vx94TnWMa3U+iN8TOH2D+0Nlawov2Bu5YA1KlAGnf9nccIxOo0818KI9ndg7fSj1eEW9pItI3ZDE/IWuSZDKj2L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429239; c=relaxed/simple;
	bh=Uf5wdHbvLT8glBukS87Z5XtjDjsk3W7uGIPm/Abkx0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtz7Pcgzunizxq8taU+MmBbwqwzRoL0qNQ2+1EmHEbz9yY5f8IwhV76X6ueRQKK0WV197HryFb4f1iaBFoJtbMIlfhWSqG2C+b9peEJgo4l3B+gcQdzWMvz9CTqMJc4FgZs2Fe9ktZ6iJdbPaMMBoL84UxLd4nnarkZUggIXoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGUU9pe7; arc=none smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84830c774a0so556556b3a.1
        for <linux-leds@vger.kernel.org>; Tue, 07 Jul 2026 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783429238; x=1784034038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjSN27vhCfpwDogooT1C63qE/61HtdzQ904BFc54Umw=;
        b=JGUU9pe7tqmFu4bKpDaWEkgiuI0RaTjOWtHk/Ssufm38R3INQd40UrzrA9EhX9DL9w
         QPrqm6/Ghqt5tb88+mCXgpD+EjPoitLBeWnZT4XMaNblrSyL5cmDB2PtjzMRzqFzK9cS
         uj+1SfZIOOBXmsk4g1q6ebHW83FmCSsh8Zq/5Hz0OShYP8GnW6WSWkS7tuNrzn87+82H
         H67NZoSR97DI+A8JgX8HhYvdmRNJxAwkcNaJMSmWtotT9Wh3gknSlY2D9b3cN9AoaVCG
         zdURVkHYKNS9PhJrfM0ze82Si50/ZCUeRCByOHSsWH0tOxzptZolmTP672fKP4i3UTfo
         DOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429238; x=1784034038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjSN27vhCfpwDogooT1C63qE/61HtdzQ904BFc54Umw=;
        b=gmjahVQBvaG7PyidRZIiC0OohwSOYyl1Aah7bHBcxAwISnN+yWaXPA/1LzVO/bKr5O
         qQL152qqDTltKtYF6cdkdrNWddCsiuxZFgiJJBBWNfvmmszlIO7HZIlQqQnv/gTCkTuw
         CABl5ct6RndnBwJ9vqWtjSj2G1gX7qsalY1iI2pelQF+aTbZrWcv2zUuxHDqc0YJKDxx
         3lXkQ4y9HgnAL9gBv1+uQ6ncMU15L0rK6k9tYXrMnm5E0L9FvZlLfZMSEyad2R0xtKwW
         U/5qw61Qe2yCDxrm3EjswNGIGyyYoBcW29X5YGwZrsItSyqVedDts/uQSirfEVyVRQK9
         A5kA==
X-Forwarded-Encrypted: i=1; AHgh+RrApKjUt0V5FSsdG7cz0tVMFErv814HmiFj5yUmjJM55pDX+6JMxiZs+Lyvnyl/gopz7Iqo1VvwuDlG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VjhvXNY+pbkt5edFAMT+oVDyBypBBkDramTcIR++/br3aDm4
	Hf08Zc6w/W/U/biykXP6B1RiGKdYFCBjka96dALYGTMkFtanlwYwCB0P
X-Gm-Gg: AfdE7cl0xa/1iwSzP1t8iHKSBDheST//VV3SNqFlmlTaFb1KDNzf7Dtam22KlgVNVT2
	3QjeLz+37Yz/7W0JqxlDlQmshQdvjofV6A2ANhujklFZtquYdLMXrMS+WMMBZEjtlRk6vDQiABu
	82lp4ti5de9UhCtuGDw0P3XvVI0hcWbkruaQpIS2zpjjZaYtseW3N/bHRsm8z8u4kutqtX3yOGM
	tLZhlT5IIqjJivstTdDCZOn13KvpDPcmDPRAEOgnjwgJdugp2phbX6v9e0LG1S+nqAAl2dc4nUA
	kBG5tQqHIsXSYVZchV6nnvpjERGS4kpxOn8vau8JmZiwNNSwCrNBqxXvwq0HS60pV9FjQAOo0WJ
	r75hAR3qr0BGTZC8a5zFHmktjKpPNi0h6reX81VgY2Hn4xRaIHOUQ12NanR7A5PsA/bECVQBGLa
	LoKlN3A9CUH6n3YabRFE171YhPDZrGrj9plY4++j94s+4Bo7cZ9KRctMA9SjVW5zZFnsYo6j4IQ
	0y4AolSHUmaJL30vqXm6Fk=
X-Received: by 2002:a05:6a00:2195:b0:848:2f74:d8d3 with SMTP id d2e1a72fcca58-8482f74dc06mr2504483b3a.68.1783429237597;
        Tue, 07 Jul 2026 06:00:37 -0700 (PDT)
Received: from [192.168.0.101] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5b95sm1010719a12.3.2026.07.07.06.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:00:37 -0700 (PDT)
Message-ID: <1b5ff53e-53fd-4600-97d8-7ba34d139e5e@gmail.com>
Date: Tue, 7 Jul 2026 18:30:31 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: leds: bcm6358: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jonas.gorski@gmail.com, noltari@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20260609181731.1379846-1-ninadnaik07@gmail.com>
 <20260610-gifted-zebra-of-reward-2ab6c7@quoll>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260610-gifted-zebra-of-reward-2ab6c7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8950-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonas.gorski@gmail.com,m:noltari@gmail.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:me@brighamcampbell.com,m:linux-kernel-mentees@lists.linux.dev,m:skhan@linuxfoundation.org,m:conor@kernel.org,m:jonasgorski@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ninadnaik07@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,brighamcampbell.com,lists.linux.dev,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ninadnaik07@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BC2D71BAF6


On 10/06/26 2:09 pm, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 11:47:01PM +0530, Ninad Naik wrote:
>> +maintainers:
>> +  - Álvaro Fernández Rojas <noltari@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: brcm,bcm6358-leds
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  brcm,clk-div:
>> +    description: SCK signal divider.
>> +    default: 1
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 4, 8]
>> +
>> +  brcm,clk-dat-low:
>> +    description: Makes clock and data signals active low.
>> +    type: boolean
>> +
>> +patternProperties:
>> +  "^led@(0|1?[0-9a-f])$":
> "0" is already in "[0-9a-f]".
Thanks for pointing out. I will remove the redundant 0.
>
>> +    type: object
>> +    $ref: common.yaml#
>> +    description: Each LED is represented as a sub-node of
>> +      this device.
>> +
>> +    properties:
>> +      reg:
>> +        description: LED pin number (0 to 31).
>> +        maxItems: 1
>> +
>> +      label: true
>> +
>> +      default-state: true
>> +
>> +      linux,default-trigger: true
>> +
>> +      active-low: true
> Drop all four above and switch to unevaluatedProperties: false.
> unevaluatedProperties should be also placed after $ref: common.yaml for
> example.

I explicitly listed those properties and used additionalProperties: 
false based on Conor's feedback in v1, but now I agree that relying on 
common.yaml with unevaluatedProperties: false is a cleaner and more 
modern approach. I will drop the explicit properties in v3.


Thanks,

Ninad Naik


