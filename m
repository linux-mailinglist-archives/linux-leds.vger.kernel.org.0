Return-Path: <linux-leds+bounces-4967-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C5FAF631D
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 22:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6EBE4A78FE
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 20:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB5F30B9BE;
	Wed,  2 Jul 2025 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoRIaife"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D53093CA;
	Wed,  2 Jul 2025 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487282; cv=none; b=WN+7AETj8D/LfgSgWZOAd6170ziWZYwR3FIDE2c/Mkr0XKid8FcK0Y2gQjOZt6moxgm4vMLfuiGReq4qkXo6SN2qZZEXpUto8dsEQqjKMBIsX50Ss2lyzh9ljYCS7eln7j15uJaSvLwomanS4p93btVVDGEn+ptIb9h4Enn/0a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487282; c=relaxed/simple;
	bh=6eSaApPhk3wJVbii9cEkGt0eTlySUhDBHN3P7aS4uUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBeK9nV2VNn5k+Et0hG0uaAQxcg2NZH3DBKCK3oOZrK0vpGnxECq/YFL+gvUR3VUnpQsEgmCcOEv7dnbsj2Kscb7yjN6feRyGd3qEIUnPqMRy/b8H6CDR+9IcrnpWMUBpAw23CEbpU1qiEBiPzfIIhgsZq3abLCoBrh2Xw7KZ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoRIaife; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B21C4CEE7;
	Wed,  2 Jul 2025 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751487281;
	bh=6eSaApPhk3wJVbii9cEkGt0eTlySUhDBHN3P7aS4uUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hoRIaifeAR9VN04Rc7+qMCtEan1HTEfv2e41o0Nvp9ZBIHJ5xrlodBpv2v8Mtwq/6
	 v4fUbXTlYgGFWl5Bh0K8/6ntwPtQoKIveaPQPPncb6FMwXuQI8fNp4Nc65EpTaz02S
	 fWFVaudbUTxo2h+LJ9my80uFO/qD+OshbnTtrBPLWOuCg6JiopHyUM9YgbnhhqiZEK
	 +ok7oKsPE8FJqfeUVM01lug5kXjpaOnJmoKHLVto321ibSKd6GvPTkQu4qWbrEBM3S
	 HVmubt+Gq5WFZYqlQ9fVKVwzdPFxZ9I6Ug6/uVOM3OpbiF6PedXEQVpbLcCAI1f0us
	 UNiGKx9uTqWeQ==
Message-ID: <5d4dfcb2-cdf5-41d6-a94f-5a116837ee25@kernel.org>
Date: Wed, 2 Jul 2025 22:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: vendor-prefixes: Add Winrise
 Technology
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: =?UTF-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Boris Gjenero <boris.gjenero@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-6-jefflessard3@gmail.com>
 <c6d0d856-0c49-4ad7-bc6f-1a228dcb2d9d@kernel.org>
 <0182CF05-6011-479C-A4A2-18A0C60F7710@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <0182CF05-6011-479C-A4A2-18A0C60F7710@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/06/2025 15:51, Christian Hewitt wrote:
>> On 30 Jun 2025, at 4:25 pm, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 29/06/2025 14:59, Jean-François Lessard wrote:
>>> Assign vendor prefix "winrise", matching their domain name.
>>>
>>> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
>>> ---
>>> Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> index f03ab02afe..a3bf93e5dc 100644
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> @@ -1711,6 +1711,8 @@ patternProperties:
>>>     description: Wingtech Technology Co., Ltd.
>>>   "^winlink,.*":
>>>     description: WinLink Co., Ltd
>>> +  "^winrise,.*":
>>> +    description: Shenzhen Winrise Technology Co., Ltd.
>> Hm? https://winrise.com/ redirects to https://amdaluminum.com/ for
>> fences and other alu products.
> 
> According to multiple Chinese chip-buying/trade websites [0],[1] and
> the internet archive [2] their domain is winrise.cn (not .com). There
> is currently no active website despite whois entries showing that the
> domain registration is still active/alive.
> 
> [0] http://www.84878.tradebig.com/
> [1] https://www.tradeeasy.com/supplier/714703/products
> [2] https://web.archive.org/web/20160312143416/http://winrise.cn/
> 
> If you’d prefer “Assign vendor prefix based on their name” as the
> patch description? we can change that for the next iteration.
If commit msg says "domain name" as an argument and it turns out it is
not matching domain name, then that other domain name least needs to be
in commit msg. The rule of domain name comes from US tickers, so only
.com should be considered. If there is no conflict and no .com
manufacturer it is fine to use whatever other name, but the commit msg
is not then correct.

Best regards,
Krzysztof

