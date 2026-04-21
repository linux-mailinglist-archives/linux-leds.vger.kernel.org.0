Return-Path: <linux-leds+bounces-7788-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMTYLgCa52kV+QEAu9opvQ
	(envelope-from <linux-leds+bounces-7788-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 17:38:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794343CD35
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 17:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BC63308809B
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 15:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9361286881;
	Tue, 21 Apr 2026 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDvu0yfC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89826ED3A;
	Tue, 21 Apr 2026 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776785541; cv=none; b=raWGwTvHeYlWJ9d2fVno5XGzGNK2CC634K7RKsTmGl9sU99iX6kZMHptyDorY38vqWAWhXmoPIDTRbJPb3Dl1VJXRdNeKISysyQinDllTos20z5JLT1Kvt4J9/QkXD2CMjgRhI2FUdvLlD+36fzA+uEzfAofl9n0rPoLcBH0LT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776785541; c=relaxed/simple;
	bh=ZuSyrZb1B8cDtkgK8u7UnvmCOkmQAraETxeC8RWQue0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqIa2BqpdQCLTpJkUnsLz2+Bv2xwgB6UP/h4Wp+Qz6++0+RqdODT0l73pwtUWUOzA3Y94Rw4fEOjgdijGmICxM1WITeHCENPHHjJmLyyOAm4Y6xkto9vEdu8a6YXlBKbyeoeQ3v+JYrupH6zzmLgrU6dBjX2npKjKSRuGhbf250=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDvu0yfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5BBC2BCB0;
	Tue, 21 Apr 2026 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776785541;
	bh=ZuSyrZb1B8cDtkgK8u7UnvmCOkmQAraETxeC8RWQue0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SDvu0yfC0rvNPHjOmHmLbzIb8mAZFyfEiVvuyrncx2AZvP1UxxJS5n6qmf1JXmZNW
	 SVbDowtvWTW1PXQdIpqR52lKpU+vtLe4+OdaJj/BDeUUapgdm0vbfZsKNlx3MnlPol
	 ERaBeZA4kFY//rmwBEXLu3qIRvLTXmG9LH6SNqz8zFwu+jD1Ca9Zav/ELHVMFHu2xS
	 xb2DnRkjhKrn7qIWoF7xxsYS05/o77TB4xoyNpAIXFvKoBWt0x/A+EjeIwkpgzcogm
	 n8RacQezs6fKmxd7tVGuG8ofLxBhQaW2BnnIV7xKJtgGdtT4notruGADn0YRzLrCs8
	 +wJs894vLcPIg==
Message-ID: <c214f270-571c-4440-919e-99fce5ac1b08@kernel.org>
Date: Tue, 21 Apr 2026 17:32:14 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <26b074972581ff398b5af964ba092c8117855062.camel@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7788-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:email]
X-Rspamd-Queue-Id: 4794343CD35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/04/2026 16:50, Markus Probst wrote:
> On Tue, 2026-04-21 at 09:07 +0200, Krzysztof Kozlowski wrote:
>> On Mon, Apr 20, 2026 at 02:24:20PM +0000, Markus Probst wrote:
>>> Add the Synology Microp devicetree bindings. Those devices are
>>> microcontrollers found on Synology NAS devices. They are connected to a
>>> serial port on the host device.
>>>
>>> Those devices are used to control certain LEDs, fan speeds, a beeper, to
>>> handle buttons, fan failures and to properly shutdown and reboot the
>>> device.
>>>
>>> The device has a different feature set depending on the Synology NAS
>>> model, like having different number of fans, buttons and leds. Depending
>>> on the architecture of the model, they also need a different system
>>> shutdown behaviour.
>>>
>>> Signed-off-by: Markus Probst <markus.probst@posteo.de>
>>> ---
>>>  .../synology,ds1825p-microp.yaml                   | 108 +++++++++++++++++++++
>>>  1 file changed, 108 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,ds1825p-microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,ds1825p-microp.yaml
>>> new file mode 100644
>>> index 000000000000..76c671a42fbf
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds1825p-microp.yaml
>>> @@ -0,0 +1,108 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/embedded-controller/synology,ds1825p-microp.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Synology NAS on-board Microcontroller
>>> +
>>> +maintainers:
>>> +  - Markus Probst <markus.probst@posteo.de>
>>> +
>>> +description: |
>>> +  Synology Microp is a microcontroller found in Synology NAS devices.
>>> +  It is connected to a serial port on the host device.
>>> +
>>> +  It is necessary to properly shutdown and reboot the NAS device and
>>> +  provides additional functionality such as led control, fan speed control,
>>> +  a beeper and buttons on the NAS device.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: synology,ds223-microp
>>> +      - const: synology,ds411p-microp
>>> +      - const: synology,ds1010p-microp
>>> +      - const: synology,ds710p-microp
>>> +      - const: synology,ds723p-microp
>>> +      - const: synology,ds225p-microp
>>> +      - const: synology,rs422p-microp
>>
>> That's one enum.
>>
>>> +      - maxItems: 2
>>> +        minItems: 2
>>
>> There is no such syntax foro compatibles. Please use any existing file
>> as example or look at example-schema.
> In the example schema, another device is used as fallback. 

True.

> This is what
> I did here.

Not true. You have enum and min/maxItems. There is no such syntax for
compatibles. I repeat.

Instead of just blindly disagreeing and saying "I did that", point me to
example-schema having compatibles with min/maxItems.



> 
> 
> Other sources suggest, I should add fallbacks that are less specific

That's not really discussed here. It all looks like some random schema
and considering amount of LLM flying on the lists I have now doubts.

You need specific compatibles.
...

> 
> If thisisn't fine either, replying to my previous message would
> probably the most efficient way to move forward [1].


> 
>>
>>> +        items:
>>> +          enum:
>>
>> No, why the list is randomly ordered.

Look here

>>
>>> +            - synology,ds923p-microp
>>> +            - synology,ds1522p-microp
>>
>> And fallback, whichever is that, is not documented alone.
>>
>>> +      - minItems: 4
>>> +        maxItems: 4
> 
> Those are devices with the exactly same known feature set.
> i. e. ds1522p can act as a fallback for ds923p, and ds923p could act as
> a fallback for ds1522p.

You are not responding to actual comments. Lets focus ONLY on above
list. ONLY. Point me, where did you document the fallback to be used
alone? First of course, define what is the fallback.

None of this matches example schema or any other bindings, none of this
produces correct constraints for correct DTS.

You need a defined enum of fallbacks and several lists for specific
fallback+front, like many other bindings in kernel.

Best regards,
Krzysztof

