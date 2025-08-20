Return-Path: <linux-leds+bounces-5268-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B07B2E6C6
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 22:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87AC31C86B16
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 20:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41DA2D481B;
	Wed, 20 Aug 2025 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjDm7D0J"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE79C275AF5;
	Wed, 20 Aug 2025 20:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755722590; cv=none; b=NihTPwo9vF+5cg6F07cyWHrvzN5AHuVEJoGgO+rwlm30TXQyRkX34gRYhLMdm9+ykxWr/iRpoQWosZxsJHWdK8yK9tT4Yd93C3LQ4F4I8Rgn3X/1pZ5Gn9jEc3h8BpuRG/p6uBuYELYoHkRywCg+oJLV2d4igvEl1pt7quTe8m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755722590; c=relaxed/simple;
	bh=HmC7iZtXmBwrqIedl8hbQEuLwrSDg5aYlRTPEbBpYAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctWGSGqGiee+FtVUJDii3892R9JHgq80aBaWwlyOb5gOn3oBzH6f2kOhZRp+vIX+q21f1tnB9yKUy5kxuzNg6N8C7LealbWMwWur9DVEjZwObfrxC+ocnGbx29tiaJm+zHzjCc7+tyj0VQOTLF7EDhwaqudFReakLWqXt6e1HdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjDm7D0J; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce52807f8so210616e87.2;
        Wed, 20 Aug 2025 13:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755722587; x=1756327387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcATB+y8OrHktrFZyrQXkmZknrCsI/ZhqWyGQPNeUWc=;
        b=NjDm7D0J0+69MdUMYsqwti5b2g0vC9puz9gfGBnZQe+kJwqnUUWVh0j7GChjt5ODAU
         9r47l7I2O3d3TpPt8rt0teYU4DFd/pMYapFZ9S2XJLww40bPWfUxlEPoeg8vU4LmIgfj
         GzNIhwhLPyNJqsVUOt6FDTnN4xHynnSDl7fZs752Tk4hGpP/o8ZooMY1Ne+fH5FWw88c
         yktAki4+6OIkbFtWKWMM2uw+IftBOpzMxsAZ2OIIScm0S880pi7bHVhXN/ALvax73NAV
         CnTsSpx98cUHEbZRGeb1FL7toijbB5Ompgz7J3xpBFSHs1SPrE9itz95fnPzR17GsZIU
         n3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755722587; x=1756327387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcATB+y8OrHktrFZyrQXkmZknrCsI/ZhqWyGQPNeUWc=;
        b=o80SfrFcWzz34ACSICOjRuiAqdJ1voqR/Z0rYWthYmf5N926L089+AokhghTdhdI1G
         HarYlCO3GNmyqSRf5uDaK0D71W4QJJN/rWpRxXIGn0AIsgtWIErIogAAHygbwKjLJbTm
         8kJDvbqYEmmlJjSaH/Xk5CfM9dc/88UAuY28bGxDtIVqIh7NAXxl6TZvkP1upQtUzI+R
         w2HNHfZMuKdNMI4ePMV8lrBJzQhrRF3yZC3Q1yBe9lSKUc+IzCBsq18MhPgU8VLSb4Wk
         SS4Z6EPOZ8NTihD3FL18cxQpjm2C55kaDPGrQWeDc3oIIcDS8YeqUSTob+QQ6OHacRGQ
         NZdw==
X-Forwarded-Encrypted: i=1; AJvYcCVX7v16JVqRD5RASF//74gTFubXm0mPlMTG7bN9ETlUH1c428sfKxo+saK1rHkaCYBAGWG/t074AvbRrgK2@vger.kernel.org, AJvYcCWQJ5wfM5zFlrK30f80eDn/5ecNYYWZglGePoInfMcrd8vml+KuqMH1xVbtO1lP0PQMqjtFFqax5GOF+w==@vger.kernel.org, AJvYcCWZkQEEHDlmnx5KxUlm1mWzZ19XellJIRqfkDT5Pl8BK0HJ7xksE8CfvttzG/u9OKdg+HYlTgL8Ovyn@vger.kernel.org
X-Gm-Message-State: AOJu0YwEg/4AzIgGPb/xPJ+ddgL4e/m+BI8L5NEIg+s+4pIBSS4JZRbH
	dnk/TIXKT4k/OfD3x59cK3Ik92jvxGMqoMJsASSL2Q4mGOpu0pO8hSWq5LidwA==
X-Gm-Gg: ASbGncvV26+JmlD+djXnNipX12Sh1ilF1aWeE0tE7aN8BAJzbznoRd57TAJdYKwYbF5
	Vf7V0SMLxGWyyX8OPyb8DjIKKZoGlF046ZSuRBi4n99GD1B67mSyMKzH36Qdj8tIjKrYGViz4Vz
	6NChUWrG3JiPk5P/BSh6Yo4o9kf9jCN5e6C4CX/N/Fw572iA6/yIriIOSwnX6LCifsIU0lECpx/
	9eTEorWk3bnEA5SaBFdV0QBhw/ONvcX5ao1rOVOvxlnI6syifW2ollyTmlPYfie9F5t2OXyNm0Q
	vff23OPAc9ODN1e67YtoaZprGCvtf1akS9MuNMo9T5dF/FZaEE1Py1HXqkS6z7fK8UIU8ASlA8T
	dtFrBq3nQ8NW5AKU1nGRgKCaU7u8YlhQK+6A=
X-Google-Smtp-Source: AGHT+IHOXDcFl/hjdTmC5pJrtCdH/hYm2FY5hiub51nUKs/kNWa0uddJMWskQHnCrQ1eRvxo7fmqLA==
X-Received: by 2002:a05:6512:acb:b0:554:fa07:c60 with SMTP id 2adb3069b0e04-55e0d539df5mr56593e87.34.1755722586698;
        Wed, 20 Aug 2025 13:43:06 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369d83sm2800576e87.67.2025.08.20.13.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 13:43:05 -0700 (PDT)
Message-ID: <42f5b747-63c2-4ffc-94ba-10ecb2e5efa9@gmail.com>
Date: Wed, 20 Aug 2025 22:43:02 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: leds: Clearly mark label property as
 deprecated
To: Diederik de Haas <didi.debian@cknow.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250815104805.405009-1-didi.debian@cknow.org>
 <b30905fa-6bd1-47dd-8371-f609d418387b@kernel.org>
 <DC2ZLORG11W0.1CS78L6F2OV4Q@cknow.org>
 <20250820-hairy-economic-wildebeest-ba25a1@kuoka>
 <DC76U4GVR0O2.1HXLEPCF8BG02@cknow.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <DC76U4GVR0O2.1HXLEPCF8BG02@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/25 12:37, Diederik de Haas wrote:
> On Wed Aug 20, 2025 at 10:14 AM CEST, Krzysztof Kozlowski wrote:
>> On Fri, Aug 15, 2025 at 02:06:49PM +0200, Diederik de Haas wrote:
>>> On Fri Aug 15, 2025 at 1:00 PM CEST, Krzysztof Kozlowski wrote:
>>>> On 15/08/2025 12:47, Diederik de Haas wrote:
>>>>> The text description already mentioned the label property was
>>>>> deprecated, but using the 'deprecated' property makes is clearer and
>>>>> more explicit.
>>>>>
>>>>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/leds/common.yaml | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>
>>>> Please first read previous discussions:
>>>
>>> [I reversed the order of the links so the oldest is first]
>>>
>>>> https://lore.kernel.org/all/20221122111124.6828-1-cniedermaier@dh-electronics.com/
>>>
>>> Rob: "They ['function' and 'label'] serve 2 different purposes."
>>>
>>>> https://lore.kernel.org/all/20240509110545.49889-1-linux@fw-web.de/
>>>
>>> Krzysztof: "I don't think there was conclusion to make it deprecated on
>>> last attempt"
>>>
>>> I agree.
>>> What I don't understand: Why wasn't the text updated to correct the
>>> incorrect statement about deprecation (that's how I interpret it now)?
>>> Or some other conclusion being made and that that will be reflected in
>>> the text and/or a deprecated property.
>>>
>>> Otherwise the confusion remains and then it's just a matter of time
>>> before a 4th person comes along proposing the same patch.
>>> And possibly even more harmful: people use it incorrectly.
>>
>> Whatever change you want to do here, I expect to address one way or
>> another these previous discussions. If the code is confusing, refine the
>> description. But not in a way which ignored previous feedbacks.
> 
> I'm not going to make a change.
> 
> I thought I would be making (more) explicit what the binding says.
> Apparently I read/interpreted it incorrectly. What I described above is
> how I currently interpret the *confusion* text/discussion. Is that
> correct? I have no idea. That I'm at least the 3rd person proposing this
> change indicates I'm not the only one who is confused.
> 
> IMO it's up to a/the maintainer to make a decision and that should then
> be reflected in the binding, which should fix any confusion.
> 
> I hadn't looked at the code yet, but *I*IUC the code should follow the
> binding, not the other way around. That's how I have interpreted
> (mostly your) comments related to various binding patches ever since I
> started actively following upstream(ing) work. Which (again) may be an
> incorrect interpretation.

I think that what we are lacking to move forward is Pavel's response
to Marek's question [0] about elaboration on the subject.
Unless there was a response and I can't find it.

[0] 
https://lore.kernel.org/all/cb3c3a1e-ec10-1e7b-1b21-3cb250f92ecf@denx.de/#t
-- 
Best regards,
Jacek Anaszewski


