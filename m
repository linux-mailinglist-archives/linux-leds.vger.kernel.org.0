Return-Path: <linux-leds+bounces-7807-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKWVCNrq6Wm2nAIAu9opvQ
	(envelope-from <linux-leds+bounces-7807-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 11:48:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71D44FFA4
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 11:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B367C30131FA
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 09:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD8A3E5579;
	Thu, 23 Apr 2026 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLTxPh64"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED13E51E9;
	Thu, 23 Apr 2026 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937126; cv=none; b=hg/4URxfF/OKrPf/XTJQ8xg29UOvWi6i8wc3+irQnKiGZxwZ8m/ioYgDcDnzLehnh06PIwpYw3Y8MvNrHDBhxfpIlK3hOgRuR7RYd689t0u8yp7d31DqJ5mncVpky4rz3IAyktIf7tHqBDQKlXfIdDtEOPfyDQ4HmdEiMXF1pZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937126; c=relaxed/simple;
	bh=pR3C1D+6wR2WoE/inF7jted1Bt91lKJKOYNIUAkUitM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLW21EGmwPX/mEhFEx0/AxiqPuqrozAtofNcMdNVZJlpZDa9uPWDppM5hv1qlj/UVwFTN5Hi2NqbB2udlsk1x+uOutj+1vESYDfxL2Dp1RASv9rlKmvWO0scnhbKSjjH46phCtRs5e20rlKhnNXH8CJYP6NBQZzfXRJy8GaS1D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLTxPh64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7A8C2BCAF;
	Thu, 23 Apr 2026 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776937124;
	bh=pR3C1D+6wR2WoE/inF7jted1Bt91lKJKOYNIUAkUitM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vLTxPh64NrRNvXik3wdYgr+rgZYWizNAEqeZ0QJ6VGt87Dg97ioCSHdpR22y4K43J
	 ToA7p/wDg1ER1zEaU1WNwBlx0LcMhWc2xAy2KM+AslSGhFen3M4ur8gZzKm9aMNZjF
	 15Q+be7EUPGbdUJQbHSt6hfAOfwcPoXD6fWvl54rhXu7dLJzJTKBdmS+7f2bS5Tlp7
	 /SHXLCbqGAxCvewtrbGyr5e2BOKTsOjmSNNASfUJrAy6gg8MEWCn8C5YERbQa9RAGd
	 O+EoSD6g0T7GrmRZ8UmcGhvt8pPbA8aSQcly4ftnjP4IGnoJxYTFwuMNJm2/SXbsnn
	 7LN0ke32qjXmw==
Message-ID: <0e7020cd-361e-4f9c-a120-ee093beea10f@kernel.org>
Date: Thu, 23 Apr 2026 11:38:37 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-1-7946a9124491@posteo.de>
 <20260421-just-benevolent-dormouse-2c35ed@quoll>
 <26b074972581ff398b5af964ba092c8117855062.camel@posteo.de>
 <c214f270-571c-4440-919e-99fce5ac1b08@kernel.org>
 <33e04947d6d55035fe310935281a4f0b9e87ae08.camel@posteo.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <33e04947d6d55035fe310935281a4f0b9e87ae08.camel@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7807-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C71D44FFA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/04/2026 18:25, Markus Probst wrote:
>>
>> Not true. You have enum and min/maxItems. There is no such syntax for
>> compatibles. I repeat.
>>
>> Instead of just blindly disagreeing and saying "I did that", point me to
>> example-schema having compatibles with min/maxItems.
> It is supposed to minimize the schema, otherwise
> 
> - minItems: 3
>   maxItems: 3
>   items:
>     enum:
>     - synology,ds223j-microp
>     - synology,ds124-microp
>     - synology,ds118-microp
> 
> would have been
> 
> - items:
>     - const: synology,ds223j-microp
>     - const: synology,ds124-microp
>     - const: synology,ds118-microp
> 
> - items:
>     - const: synology,ds124-microp
>     - const: synology,ds223j-microp
>     - const: synology,ds118-microp
> 
> - items:
>     - const: synology,ds118-microp
>     - const: synology,ds223j-microp
>     - const: synology,ds124-microp

Only one device is the fallback for given groyp, not each of them.

There is no such syntax in the kernel, nowhere. Please do not invent own
stuff.

> .
> 
> In the case of dts validation, this is the same, with the exception of
> allowing any order. See below why the order does not matter.
> 
> And yes, the example schema didn't use min/maxItems.

Yep. It is also explained why in writing-bindings - list is STRICTLY
ordered. Not flexible. And example reflects that. BTW, other bindings as
well, so recent EC patches is good way to learn:
(although I understand that in-tree patches do not cover your case)

https://lore.kernel.org/all/20260327-add-driver-for-ec-v7-1-7684c915e42c@oss.qualcomm.com/

from:
https://lore.kernel.org/all/?q=dfn%3Abindings%2Fembedded-controller%2F


>>
>>
>>
>>>
>>>
>>> Other sources suggest, I should add fallbacks that are less specific
>>
>> That's not really discussed here. It all looks like some random schema
>> and considering amount of LLM flying on the lists I have now doubts.
> I am not using an LLM for coding. But it is the first device tree
> schema I try to write.
>>
>> You need specific compatibles.
>> ...
>>
>>>
>>> If thisisn't fine either, replying to my previous message would
>>> probably the most efficient way to move forward [1].
>>
>>
>>>
>>>>
>>>>> +        items:
>>>>> +          enum:
>>>>
>>>> No, why the list is randomly ordered.
>>
>> Look here
> Was answered below. They have the exactly same known feature set, thus
> the order does not matter. i. e. there is no known difference.
> 
>>
>>>>
>>>>> +            - synology,ds923p-microp
>>>>> +            - synology,ds1522p-microp
>>>>
>>>> And fallback, whichever is that, is not documented alone.
>>>>
>>>>> +      - minItems: 4
>>>>> +        maxItems: 4
>>>
>>> Those are devices with the exactly same known feature set.
>>> i. e. ds1522p can act as a fallback for ds923p, and ds923p could act as
>>> a fallback for ds1522p.
>>
>> You are not responding to actual comments. Lets focus ONLY on above
>> list. ONLY. Point me, where did you document the fallback to be used
>> alone? First of course, define what is the fallback.
> In this schema, I defined ds923p as fallback for ds1522p, and ds1522p

You did not define ds923p as fallback. It is used as front compatible as
well. Fallback cannot be used in some contexts at front:

+        items:
+          enum:
+            - synology,ds923p-microp
+            - synology,ds1522p-microp

> as fallback for ds923p. There was no separation of front and fallback
> until now. See below.
> 
>>
>> None of this matches example schema or any other bindings, none of this
>> produces correct constraints for correct DTS.
>>
>> You need a defined enum of fallbacks and several lists for specific
>> fallback+front, like many other bindings in kernel.
> So now I can imagine what schema you want to see.
> 
> i. e.
> - items:
>     - enum:
>       - front1
>       - front2
>       - front3
>     - const: fallback1
> - items:
>     - enum:
>       - front4
>       - front5
>       - front6
>     - const: fallback2
> - enum:
>   - fallback1
>   - fallback2

Yes

> 
> But I am unsure how to determine which devices are the fallback and
> which are the front devices, given some of them have the same feature
> set. The oldest device as fallback each?

You can open your v1 or other versions. They were quite clear about
fallback: it did not matter for you which device is used as fallback at
v1, because you treated each device as the same programming model. I
assume you treated them the same, because you did not know the
differences (which is fine), so it should not matter that much now.

If unsure, choose oldest device, less features or eventually smallest
number.


Best regards,
Krzysztof

