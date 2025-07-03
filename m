Return-Path: <linux-leds+bounces-4985-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D972AF7105
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 12:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A263A9744
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 10:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A0C2E2F04;
	Thu,  3 Jul 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gl2H4/2J"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB1B29C33E;
	Thu,  3 Jul 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540088; cv=none; b=G8hG2Ymgo8a85oTHFgocKswzWp8cpirDfBgJPSfqgrL5O6d3ay6wT9efQDoyZbA7NqUgnVq8dvFYhDN9HW+lPzGA9wnDeMRMfPKMnJpVzzPquhHBJLVtufEe4nS8hJH2H+dhWW6/fjKHrAltcBZsyfOSm4ABPyWn9XPWRTXhifw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540088; c=relaxed/simple;
	bh=cRCXm0lP5n7xm7KKxtJF4+SEXeDjRYvbNgycsf6d4z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQVZYiFaquCXxxONr9uUObcQWEHucdVdeWsCEXc2Mgr+vCv/ctT7aMaYBVT3q9FhPJ9BGWubT7pgzcr1aLTSWxXKR+K8BIKK9GBXcItJZI8ibPrFaZYt1FN2OdhZG88cKbCo6rKYui4WXqU06FgCs0sFJ+C3WGpa9R2cU4w3FrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gl2H4/2J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA92C4CEE3;
	Thu,  3 Jul 2025 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751540088;
	bh=cRCXm0lP5n7xm7KKxtJF4+SEXeDjRYvbNgycsf6d4z0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gl2H4/2J5NiEV5eUw+iJsAhi1S9EFE2GUFjmTlKBuTkDKp52gx20an4BFa8cOWPEM
	 /11TdmCJICe7auCfZY5ay/ipRTwqs9lqhfSwVBEwRsfgi9Dum041f8y8rBDIq4n3r1
	 5qNiHRgdtar9c+dzXKCD0ruEdT1H9KFNPwdpalAmIj/0yaXjH4QUGkka8BFbTzIX1M
	 V8iGBli3W6Ui2Oez/YpuCn0oA3Al4YVKDbH7IKOOW9rigjP+L5yUZBEdIOO4l2Tsd2
	 EXgiDjuHaRuXRqA3+M9cfq1qwfB2Maqw32FMzKKLynhA5GL0JsmYZtRDokucIlXSvm
	 vS75om15fa3NQ==
Message-ID: <1c95927e-a028-43fe-bdf5-449767b49ec1@kernel.org>
Date: Thu, 3 Jul 2025 12:54:43 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>,
 "lee@kernel.org" <lee@kernel.org>, "pavel@kernel.org" <pavel@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
References: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703093430.229959-2-Qing-wu.Li@leica-geosystems.com.cn>
 <85e411bf-58cf-46fe-9afa-7b76999f1a42@kernel.org>
 <AM9PR06MB795507373B99DFF6820D979ED743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <AM9PR06MB795507373B99DFF6820D979ED743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 12:27, LI Qingwu wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Thursday, July 3, 2025 5:59 PM
>> To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>; lee@kernel.org;
>> pavel@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; linux-leds@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org
>> Cc: GEO-CHHER-bsp-development
>> <bsp-development.geo@leica-geosystems.com>
>> Subject: Re: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
>>
>> This email is not from Hexagon’s Office 365 instance. Please be careful while
>> clicking links, opening attachments, or replying to this email.

Please drop this, it is not relevant in upstream discussions. Use normal
email client which will not produce useless header above.


>>
>>
>> On 03/07/2025 11:34, LI Qingwu wrote:
>>> some pwm led driver chips like tps92380 require a separate enable
>>> signal
>>
>> Sentence starts with capital letter.
>>
>> tps92380 does not have dedicated enable pin. It has VDDIO, which serves also
>> enable purpose, but it is a supply.
> 
> So this patch is unacceptable anyway?

If you make this patch for tps92380, I think it is not correct. You have
entire commit msg to explain the hardware and all unusual things. Having
VDDIO and EN pin is unusual, because you do not supply power directly
from GPIOs of a SoC. All this should be explained.

Best regards,
Krzysztof

