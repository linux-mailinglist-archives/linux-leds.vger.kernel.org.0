Return-Path: <linux-leds+bounces-4065-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E7A416F4
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2025 09:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6E541895577
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2025 08:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1E9241CA2;
	Mon, 24 Feb 2025 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNgqshJv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE302417C2;
	Mon, 24 Feb 2025 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384671; cv=none; b=En6j9NvJiu7USGkH3BS45/eAdT5BZH1QG7y0hp488w5XF3F57vYkTLAtVnSLHO7NykuFVDRliuDWdXiKuzvceP3ZGIXJkI6GthULlk0e0V5EuC2i078DnFeI4nN0Yi5XM1uhBIAyjlzMtvhVqsACHMzFrY+jV+uQyR1cgUPsk8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384671; c=relaxed/simple;
	bh=XeJkQDc4AhpFioo9gr+LS5UXIJ0XZpuDmfYxSva973A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQsrwvooS4mRm83AAkUDlW4fVNRQxNwN8AgRqWHViM9ECMGQ0iIgbpso/isSWuy/0DOpTA1Yx6F7xUM/YJwI/B35pG/BKK73ew09IHnSjorSN+a6x9advHw42Kclo4p7fSd6xgDo1DG5vLwbYv8PR+NhJdlCtfu5iCoOakc18Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNgqshJv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28864C4CED6;
	Mon, 24 Feb 2025 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740384670;
	bh=XeJkQDc4AhpFioo9gr+LS5UXIJ0XZpuDmfYxSva973A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uNgqshJvRf+EdavFAOz5AIPHMAcu9tlTznGt4GrGLCMiDFVGrP1J8pXgUh844o2bN
	 +z8w1sAXH2tNwgNkZTQDyqYCvZyVM1q6BpUdoBxWLfzZbMYJpWZ6rlX4cnpMuHI7I9
	 ZtVet4BN3EeAWsDao8PMce79iCpii3qJPZylO58GyLYv6sLbi2siS7a2AUluk8Abnd
	 h5gujSXbSgJqXUlWlq1V3RfLbp6idesShNFDFkagKEx27EFM9B2tOL/ArIPRbf5X84
	 f/lahWC2hkY4obG2qWe6sxvNb17wbjRBpKlFu457zrO5btjBe0yEbGc/YrGM5RH4dj
	 NE3QuthAmVWlQ==
Message-ID: <94e9c990-e37f-4980-86c3-35f390e11395@kernel.org>
Date: Mon, 24 Feb 2025 09:11:04 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings:leds: Add function define for POE
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Tony O'Brien <Tony.OBrien@alliedtelesis.co.nz>
Cc: "pavel@kernel.org" <pavel@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 Ben Hoelker <Ben.Hoelker@alliedtelesis.co.nz>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20250213005841.4143929-1-tony.obrien@alliedtelesis.co.nz>
 <20250213005841.4143929-2-tony.obrien@alliedtelesis.co.nz>
 <20250213-successful-pronghorn-of-dignity-83facb@krzk-bin>
 <31bc5340976761dbf3653ed2802a8988e07b18d5.camel@alliedtelesis.co.nz>
 <7462bb47-01ff-45d7-9cbc-24b8da7f7a1d@kernel.org>
 <7a6c287c-45f6-4193-a29a-6c6a29eee3e4@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <7a6c287c-45f6-4193-a29a-6c6a29eee3e4@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/02/2025 21:54, Chris Packham wrote:
> Hi Krzysztof,
> 
> On 17/02/2025 22:13, Krzysztof Kozlowski wrote:
>> On 16/02/2025 22:37, Tony O'Brien wrote:
>>> Hi Krzysztof -
>>>
>>>> Where did these two reviews happen?
>>> They were in-house reviews.  Please feel free to remove them from the
>>> patch.
>>>
>>>> Where is any user of this?
>>> We are adding Kernel control of PoE LEDs and thought this might be
>>> useful to others, maybe those working on netdev, or anyone implementing
>>> PoE on their devices.  Also, the Kernel >> Docs >> LEDs page states:
>>> "If required color or function is missing, please submit a patch to
>>> linux-leds@vger.kernel.org", which is included here.
>> You did not answer: where is the user? By "we are adding" you mean
>> downstream?
> 
> It's downstream. One of our PoE switches in development which uses a 


So for me that's a no. We don't care about downstream. Otherwise we
would need to accept whatever else people invented and never bothered
with upstreaming.

> pca9552 LED controller. I suggested to Tony that we get this upstream as 
> I know there is some work going on to support PoE PSEs in netdev. I did 
> wonder if we wanted to make this more specific i.e. have "pse" and "pd" 
> as different functions but something like "poe" seemed fine as you're 
> not going to have something that is both a PSE and a PD on the same port.

To me, this is not a catalog of all possible LED functions. Come with
any sort of user - either driver or DTS (and I still remember discussion
with Hans de Goede about taking such patches without DTS user, but that
was under condition there is driver user).

Best regards,
Krzysztof

