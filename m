Return-Path: <linux-leds+bounces-7344-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAdaKRtqtWkM0QAAu9opvQ
	(envelope-from <linux-leds+bounces-7344-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 15:00:59 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5228D689
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 15:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F21AD303A25F
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 14:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D33B378D86;
	Sat, 14 Mar 2026 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVrAoIMZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9601E1E16;
	Sat, 14 Mar 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773496807; cv=none; b=T2Ma+uxhyaFKDmI6New6CvmU7LBT8JkLgWkUfQ1rKNSXFNUqojZ91wXh8R7D9pNFFy1JZSUTCy6n8FYcbXLuSSMoBJVspGYC/vZtlqJzOqXzR9NQQUQAPkogUTDTtvDHBSg2abUhX+aGcfPSaGQwL7t7vZ89zlE/3cAv5vQanCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773496807; c=relaxed/simple;
	bh=1+vB6Fh0hWuDgVa5lqXyiRNifiXr1Y6OZeg8vSQVs5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pa2gpZzxGSIbpw/q1Upohin16GLK8CvAzSggerDlSEopPXKnWbcr7gH2g+cb/kJ+/BmC8FlTd0zgYIsrSd9fxMtOlgVwHQvfI1j+3sLG+dMUAXYvK/qdc2Dpq3AXN0xmrEBLnk2kN8goDDCGUYrSeEm7iuiUYFfUv4oHPO1kVJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVrAoIMZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4B3C116C6;
	Sat, 14 Mar 2026 13:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773496807;
	bh=1+vB6Fh0hWuDgVa5lqXyiRNifiXr1Y6OZeg8vSQVs5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QVrAoIMZxICmvffRH8O7N7SIUO7gkYz38hFkr8r/CBMuTWGv+8nuSuSvJGn4nwIdd
	 NnfDqcS+5TVX0xcKguvpScSfM9QBrBPBr9wOM4GaOa4os1WUTy86kuP5VBma5B4Lay
	 +4G1RdCp+zlJ/Tsyo0P6bht08cjRTltDNHgVUg4nZrQ2qd5+E6aNiuOqStjbWr5P8F
	 mXPxoECpMkrrwuk6Z/2fBRhJxSjtDUdzDrAlfJRXdhU49x+vdjp1OoWbzmoQN+f6LG
	 t+/2z+HeeFx97feR234cKyC4djshItRkiASYBk8Ku0FT8gjJllIbZjBerVS9smnVdP
	 taL12cz2ApG/Q==
Message-ID: <88f53ef1-5c3c-44d7-a749-a03b9563a552@kernel.org>
Date: Sat, 14 Mar 2026 14:59:57 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] dt-bindings: mfd: Add synology,microp device
To: Markus Probst <markus.probst@posteo.de>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Robert Moore <robert.moore@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
 <20260313-synology_microp_initial-v3-5-ad6ac463a201@posteo.de>
 <02e0772d-ba65-4eb8-8453-e0b3eaa4af96@kernel.org>
 <6f2298f3298dc81e6e2ed34ca43424fc39ce3518.camel@posteo.de>
 <336523bb-615b-451b-8681-c965bf579203@kernel.org>
 <97c64ee64734debae475716b4d588dee59889f70.camel@posteo.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <97c64ee64734debae475716b4d588dee59889f70.camel@posteo.de>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7344-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[posteo.de,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[wikipedia.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08C5228D689
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/03/2026 13:31, Markus Probst wrote:
> On Sat, 2026-03-14 at 09:49 +0100, Krzysztof Kozlowski wrote:
>> On 13/03/2026 21:29, Markus Probst wrote:
>>>
>>>> This is not an "MFD" device.
>>> It now uses the MFD APIs. By the definiton of @Lee (assuming I
>>> understood it correctly), this device should now qualify as "MFD"
>>> device.
>>
>> No. Using Linux framework does not make this device MFD, since there is
>> no such term of hardware as MFD. Otherwise please explain or link to
>> verifiable external source describing what sort of device class is MFD
> I assumed these comments would also apply for the dt bindings:
> -
> https://lore.kernel.org/rust-for-linux/DGYAFNSJ7576.1E0JZ2W499ZQ7@kernel.org/
> -
> https://lore.kernel.org/rust-for-linux/20260309151555.GU183676@google.com/

I don't understand your question. We talk here about bindings, so why do
you ask if the comments are about bindings?

> 
> given that using linux MFD APIs also changes the structure of the dt
> bindings with added sub-devices.
> 
> But it seems no?

> 
>> because for sure this is not MFD how Wikipedia defines it.
> 
> Wikipedia defines it as a synonym for a "multi-function
> product/printer/peripheral"
> https://en.wikipedia.org/wiki/Multifunction_device

I know, not need to state obvious. And this is not a printer.



> 
>>
>>>
>>>>> +
>>>>> +    mcu {
>>>>
>>>> Please read previous comments.
>>>
>>> You are likly trying to refer to this comment from you:
>>>> Depending what this is. MCU is generic purpose unit where you load
>>> your
>>>> different FW for different purposes and you have here specific - to
>>>> handle certain aspects of this entire machine. This looks like EC, so
>>>> should be called embedded-controller and placed in that directory.
>>> Synology uses Microchip PIC for this purpose. On a Synology DS215j, it
>>> uses a "Microchip PIC16F1829". At least to me, this looks like a
>>
>> It does not matter what chip is used. Every component uses some sort of
>> chip.
> I would be interested in what does matter then.
> 
> I did not actually find an exact definition for what
> Documentation/devicetree/bindings/mfd

Because there is no such hardware as MFD.

> and
> Documentation/devicetree/bindings/embedded-controller
> is for in the kernel tree or in the devicetree spec.

Commit msg moving several devices there explained, no?


> 
>>
>>> general purpose microcontroller with firmware from synology flashed
>>> onto it. Therefore it is a MCU.
>>
>> Every chip is then an MCU with such logic. Every PMIC, every EC.
>>
>> This is for me clearly embedded controller and that's where this should
>> be placed and called.
> In that case I will move it to
> Documentation/devicetree/bindings/embedded-controller and update the
> node name used in the example.
> 
> I will wait a bit for the other patches to be reviewed before sending a
> next revision.
> 
> But I wonder how
> Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
> got in there then, given it is pretty similar to this device in the
> functionality it provides.

Great question. How do any bugs, mistakes, different judgments or
imperfectness got merged?  How is it possible that code for example is
reviewed but has a bug? Don't ever use arguments that something
somewhere happened, so you can do the same.

Not mentioning that if you even question this, you could at least look
at the history which would tell you if "embedded-controller" directory
existed that time or not.

Best regards,
Krzysztof

