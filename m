Return-Path: <linux-leds+bounces-2232-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6F92CE0B
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 11:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DE381C22CAB
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 09:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0919A16D4F9;
	Wed, 10 Jul 2024 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dYEiv8mv"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518E12C499;
	Wed, 10 Jul 2024 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720603049; cv=none; b=kpQ58Di2qXAGfXN76pjvB58/GyhL9Nbva/efFbHBMbcSkQnR/3Z4dO+aWgEatXzGeWLcCLqXXOlM5Z/ocpZ0lwRVuJ9b9vUNSXL1IMqOez/k/Kkg+Awi5yUbJDqXv3IDvz578LbrujLNHxFVov4Zq/Tpga4jezj2Hq58CRUv0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720603049; c=relaxed/simple;
	bh=+T4zSD4BbddsQZkS+d9w86+tE5Cgy8/QZdH5HfOc6jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAY9Rsh0Xr+7bfqYCdtW2spmJdIrpE4Y08Z+MzCgvXBQJZ09FDKLsf6CIzgTJZhpY501GbidOmzsjSYBXJNG005AbL4uktvZY/Y5ljWLc/XBvIlxMrQ2WxltaK2dmDSNFpzH22+yJ1KjQrXZMBSCtdGn7Cn4ID44ErgM8AMhK7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dYEiv8mv; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70CA51BF20C;
	Wed, 10 Jul 2024 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720603040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Vq6c6zQJ5STPjXJWArRYJTwadtByWSpM28wF5Y4YCc=;
	b=dYEiv8mv3Mk7z1F/p+M+sFw88YsXfKINfEBvU3R7OVqB0VAd0Rbl+nYFFtc0eUATDI/+4u
	vJBR5E1XAvymVyGUllzQCJPZ1PInWE+Dg0kdEdZz3bXKbdM8ZoPCIwS9p0xxEsL9Q9Vyvx
	xbQ8CzZgKbFz1Yqj1REvk/IdILKznvaXNPAH/XCs7th2b7X72WulVyjMi1TKP5a4n5zhIT
	0/YZNhBZItjQkH78ao8UqnD/GTJS2bEEqsGOZ8axlfVz08RNjZEaVVt8ZJP96XIImtIrkJ
	C/X+tFSQjoVPW6Cy7eSfXOnzVfb/aeB4GCtXxcFkl+QC4g+mUqb48oCp4m45ag==
Message-ID: <b88d211f-3c5b-4428-bd94-3d089c56ed22@bootlin.com>
Date: Wed, 10 Jul 2024 11:17:18 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] leds: pca9532: Use PWM1 for hardware blinking
To: Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
 <20240617143910.154546-3-bastien.curutchet@bootlin.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <20240617143910.154546-3-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi Lee,

On 6/17/24 16:39, Bastien Curutchet wrote:

> +static int pca9532_update_hw_blink(struct pca9532_led *led,
> +				   unsigned long delay_on, unsigned long delay_off)
> +{
> +	struct pca9532_data *data = i2c_get_clientdata(led->client);
> +	unsigned int psc;
> +	int i;
> +
> +	/* Look for others LEDs that already use PWM1 */
> +	for (i = 0; i < data->chip_info->num_leds; i++) {
> +		struct pca9532_led *other = &data->leds[i];
> +
> +		if (other == led)
> +			continue;
> +
> +		if (other->state == PCA9532_PWM1) {
> +			if (other->ldev.blink_delay_on != delay_on ||
> +			    other->ldev.blink_delay_off != delay_off) {
> +				dev_err(&led->client->dev,
> +					"HW can handle only one blink configuration at a time\n");

I'm having some second thoughts about this dev_err().

It was dev_dbg() in V1, but based on your suggestion, I changed it to 
dev_err() because an error was returned after.

I've worked more with this patch since it got applied, these error 
messages appear frequently, though they don’t seem to be 'real' errors 
to me as the software callback is used afterwards and the LED blinks at 
the expected period.

Don't you think a dev_dbg() would be more appropriate in this case ? Or 
perhaps a comment instead of a message ?

> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	psc = ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> +	if (psc > U8_MAX) {
> +		dev_err(&led->client->dev, "Blink period too long to be handled by hardware\n");

Same comments for this dev_err()

> +		return -EINVAL;
> +	}


Best regards,
Bastien

