Return-Path: <linux-leds+bounces-7639-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDrAL3vG02mqlgcAu9opvQ
	(envelope-from <linux-leds+bounces-7639-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 16:43:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981B3A451B
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 16:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4305A300538B
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2026 14:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB773845CD;
	Mon,  6 Apr 2026 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4us0LBe"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C653191BD;
	Mon,  6 Apr 2026 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486585; cv=none; b=CgdGxW1wjzFKd406DXmfKk9ted4/eAvKo4n+EJqciwNIW7dYAZXQRQeoFjCfw83bs5t65HkSRjWKpHctgUCxsZB3Rjp5ENEjae5+41j3ItbD8s6JL8idWXe4/qAcgtPCLBa0x7rxKOllpTyRQd9CisLbNBlGof+tgckMTZKgwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486585; c=relaxed/simple;
	bh=ApNdW19i/LuL6qU+6B5aKj6aak2kjqBjXqYT6YTUH8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFB5BxuixOB9EXcN8Uw2YCGHKqyIPUcmrMYoQwTJdQ5aULRD3y613d3knXEBy5sRVy96reYHNOoIbIwBy6GkTQ8Xs5rJSFEsx15pDfGzQYRGj4sJW/uRFjFFucEhMW/RP3jT+KQj3x/rkZCYxZsUQslSnjhCH6nlAncrpL3NAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4us0LBe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D380C4CEF7;
	Mon,  6 Apr 2026 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775486585;
	bh=ApNdW19i/LuL6qU+6B5aKj6aak2kjqBjXqYT6YTUH8M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V4us0LBeMNlNE28B0Gc1edZUs9wzGuAg2OpPHG8ti6bb1ag7LZnBSGzsw9GErVKbW
	 UgNeoBruXIXs5Rs2gIXtl9ktzXMUEnpLGesp6YL0mELhO0sIm1A/KDJB14WnSfa/ki
	 ng1kwea0l6qcK1rWnofB8mJsV/Dd5iO5fhci25FOWoxRGA9uTgrqUIZdjaMWELTKJY
	 iodVUm5dUGk7Cp2Zh/gYfbBd4hInOwrDpt7cYCNs8ra30JaiyD8efsmTsn3m/UWY4Y
	 QQaasksXLpzxoBgQJCG8Il0R+OwB7C4XqIas8XSLXxNjUpEu6h99aEot3u3yI939b0
	 F0gvQyV7+eheA==
Message-ID: <0b785ee4-7d15-4a9d-a820-20ea15225ea1@kernel.org>
Date: Mon, 6 Apr 2026 16:42:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] dt-bindings: embedded-controller: Add synology
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
References: <20260405-synology_microp_initial-v6-0-08fde474b6c9@posteo.de>
 <20260405-synology_microp_initial-v6-2-08fde474b6c9@posteo.de>
 <20260406-ancient-amethyst-poodle-1ba0b2@quoll>
 <63fbd1a5cddc5b79302056fa7b01a790aca8ba8e.camel@posteo.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <63fbd1a5cddc5b79302056fa7b01a790aca8ba8e.camel@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7639-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,posteo.de:email]
X-Rspamd-Queue-Id: 5981B3A451B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 06/04/2026 16:22, Markus Probst wrote:
> On Mon, 2026-04-06 at 09:59 +0200, Krzysztof Kozlowski wrote:
>> On Sun, Apr 05, 2026 at 07:36:29PM +0200, Markus Probst wrote:
>>> Add the Synology Microp devicetree bindings. Those devices are
>>> microcontrollers found on Synology NAS devices. They are connected to a
>>> serial port on the host device.
>>>
>>> Those devices are used to control certain LEDs, fan speeds, a beeper, to
>>> handle buttons, fan failures and to properly shutdown and reboot the
>>> device.
>>>
>>> This includes the following compatible ids:
>>>  - synology,ds923p-microp
>>>  - synology,ds918p-microp
>>>  - synology,ds214play-microp
>>>  - synology,ds225p-microp
>>>  - synology,ds425p-microp
>>>  - synology,ds710p-microp
>>>  - synology,ds1010p-microp
>>>  - synology,ds723p-microp
>>>  - synology,ds1522p-microp
>>>  - synology,rs422p-microp
>>>  - synology,ds725p-microp
>>>  - synology,ds118-microp
>>>  - synology,ds124-microp
>>>  - synology,ds223-microp
>>>  - synology,ds223j-microp
>>>  - synology,ds1823xsp-microp
>>>  - synology,rs822p-microp
>>>  - synology,rs1221p-microp
>>>  - synology,rs1221rpp-microp
>>>  - synology,ds925p-microp
>>>  - synology,ds1525p-microp
>>>  - synology,ds1825p-microp
>>
>> Drop, we see this in the diff.
> A prior review commit suggested I should add them [1].
> So only synology,ds923p-microp in the Subject then?

I do not see how this list resolves my comment. Really, explain my how
listing part of binding answers WHY they are not compatible?


> 
> [1]
> https://lore.kernel.org/all/20260330-delicate-sassy-mayfly-ebcca7@quoll/
> 
>>
>>>
>>> Signed-off-by: Markus Probst <markus.probst@posteo.de>
>>> ---
>>>  .../synology,ds923p-microp.yaml                    | 112 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   1 +
>>>  2 files changed, 113 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
>>> new file mode 100644
>>> index 000000000000..4518e9b74be1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds923p-microp.yaml
>>> @@ -0,0 +1,112 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/embedded-controller/synology,ds923p-microp.yaml#
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
>>> +    enum:
>>> +      - synology,ds923p-microp
>>> +      - synology,ds918p-microp
>>> +      - synology,ds214play-microp
>>> +      - synology,ds225p-microp
>>> +      - synology,ds425p-microp
>>> +      - synology,ds710p-microp
>>> +      - synology,ds1010p-microp
>>> +      - synology,ds723p-microp
>>> +      - synology,ds1522p-microp
>>> +      - synology,rs422p-microp
>>> +      - synology,ds725p-microp
>>> +      - synology,ds118-microp
>>> +      - synology,ds124-microp
>>> +      - synology,ds223-microp
>>> +      - synology,ds223j-microp
>>> +      - synology,ds1823xsp-microp
>>> +      - synology,rs822p-microp
>>> +      - synology,rs1221p-microp
>>> +      - synology,rs1221rpp-microp
>>> +      - synology,ds925p-microp
>>> +      - synology,ds1525p-microp
>>> +      - synology,ds1825p-microp
>>
>> So we already talked about this and you were told to use compatibility.
>> Your driver clearly states several of these are compatible, so I am
>> confused that I do not see it expressed here.
> The driver does not have all functionality implemented yet.

Either this drivers works or not. If it works, explain me how they are
not compatible.

> 
> A few examples of differences not yet visible in the driver:
> - synology,ds214play-microp is the only model in the current list to
> have an cpu fan
> - 4 of the models are arm based and need a different shutdown behaviour
> - different amount of fans (already present in the binding via fan-
> failure-gpios)
> 
> I could try to group them together, but Synology does not document the
> exact difference between them.
> 
> As Rob mentioned [2], I need to be able to handle unexpected
> differences without qurik properties.

I did not object that.


Best regards,
Krzysztof

