Return-Path: <linux-leds+bounces-6512-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A7CEB818
	for <lists+linux-leds@lfdr.de>; Wed, 31 Dec 2025 09:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99935300F9C3
	for <lists+linux-leds@lfdr.de>; Wed, 31 Dec 2025 08:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78E33126C6;
	Wed, 31 Dec 2025 08:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyyhMsS2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87203A1E82;
	Wed, 31 Dec 2025 08:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767168206; cv=none; b=kOeOHpMF2fu4R7LOhV4msGoevyRTXHbskzzRIQaKxCS8IdLz8Pj22IfFA+hO8A1H8MUUkVmeip0cqKXkDV0X6BIRAucRvU4NbFBEyPLRxVBzLu8mJG/69Wbg74m3ONR3NPp/5H/jTlwvjr6WN3ijanU1tDI/fUTpaeDq28+PkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767168206; c=relaxed/simple;
	bh=8Xx8KhhfekkIy4200axEh65RpoZkqNIV37FMiA2l73o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=taPcQFJbR+GbYarNuA/hcUYlF4D7HzQBZMd4dHFhs/XbVRpKqLK1remktRjbG9oYvTvc3+usfAmv6lmkh2SNm9BMJ6uIYDLQppkXNsFW6jVGH5BPYQ1u6B3E1e5mn6mwOJgscUlpa5jZNwQiCPOxRxeuR+RydtmyLsCx8xmuPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyyhMsS2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF86C113D0;
	Wed, 31 Dec 2025 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767168206;
	bh=8Xx8KhhfekkIy4200axEh65RpoZkqNIV37FMiA2l73o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LyyhMsS2cZcVnpQdAuoYb793JT6bVRE1yKs8FQTL4dhVke0LEOhvRkWH3FBg05QuO
	 988iaynnFId1Bv/igjMJ9EcLBBHQ/2VtB9eQsSnUwtzbuk1/FrqJIEtQ/AnJNYbm+z
	 3C17nMy0cI4Xapa9hu5aN45t5sUYem2KtjtftQSQxRAoZC81/74asn4S4McxvCAW0d
	 gh/+OEanpvCkQ/1Zapks+rn6+hI35ggqFQsxojdhASAOkwGhWFPUpCndw4QUeSTUOq
	 2r8cGXAbZ2yXXbQN8fiK5BoPDSpkLFiD8f3QtTxc1DG7GTSnDvaoff7GpD3i8Eba0M
	 iZeckbLS/7i6Q==
Message-ID: <cfe39a0e-e475-4d0d-bad6-461b25f430ef@kernel.org>
Date: Wed, 31 Dec 2025 09:03:21 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] dt-bindings: leds: Add virtual LED group
 controller bindings
To: Jonathan Brophy <Professor_jonny@hotmail.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Jonathan Brophy <professorjonny98@gmail.com>
Cc: Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, lee Jones <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20251230003250.1197744-1-professorjonny98@gmail.com>
 <20251230003250.1197744-4-professorjonny98@gmail.com>
 <176705797007.3053564.852280537388416393.robh@kernel.org>
 <DS0PR84MB3746BAB4FEB95BA7AB47BECB9FBCA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DS0PR84MB3746BAB4FEB95BA7AB47BECB9FBCA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2025 09:32, Jonathan Brophy wrote:
>> My bot found errors running 'make dt_binding_check' on your patch:
> 
>> yamllint warnings/errors:
> 
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: pwm-led-controller (pwm->leds): 'led-pwm-blue', 'led-pwm-green', 'led-pwm-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', '^pinctrl-[0-9]+$'
> 
> 
> Thanks I have fixed this and re submitted a v5 patch series.
> 
> I have been testing on OpenWrt where the yaml and dts files are not validated and this slipped in.
> 


You must base and test on mainline, not OpenWRT. I understand above that
v5 wasn't tested either, so I won't be reviewing it.

Best regards,
Krzysztof

