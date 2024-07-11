Return-Path: <linux-leds+bounces-2255-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 951B192E292
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 10:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C767F1C21212
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 08:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6521509AE;
	Thu, 11 Jul 2024 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V5xQMwzf"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E61448DD;
	Thu, 11 Jul 2024 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687253; cv=none; b=IMShgKk9XMoVeR6HrYaMqpjehZJf8X4OXvDR78op0BMVZxVP5sdNkVJfdP4ddvZqUUURdrl+CKfu7Vas2DOSM/U2rXSuFEspwCoqb8pYfJxmHEw2vDe7sd80+9hYZ9U9H1TuEdOEwH+3bz7nUnTTLxcWRzNCM7Eq6fIIhYFNQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687253; c=relaxed/simple;
	bh=famdeh/OSzA9p1L4c3FAr90cpd1FQcpHTzNbdVcKP9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRAV/AzvSNeGSz+A4tAfxyYGBUBBknY+iVpIiv1MZ/8aXP9RrJdj9ndLY0QjB5yYtMNw3/8ua3iNfsd4tDA+3YA7+M9HkQKOk7gJjUK/8Mk0dz/WAZlUe6LuwMb5ei45dkUeCIgML9bLVqK+Q518KhU24wuhG1OeqNJICfQTZyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V5xQMwzf; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD2F41BF208;
	Thu, 11 Jul 2024 08:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720687249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwCbGQFVAAOUEBl/l41/SRNr5G86ZeOQCV7PhWW1kmc=;
	b=V5xQMwzf3KW7VsUiDr8qVD51hka5jIX8IBwf5OFJyzhtPCw8jVElKP7jWzgdkWH9OLeDHI
	e2Y+d9BxMpid82HrKD2DySGiGd4ZNOQi2VB6WzKx4tIYrGZ1IPEvbgFiZj2Lyz0A0y0XNg
	ETjzSRj4VPqKotp6R8Y5XZpaDW4KCWzpjaVK++fsS2/BlrDYdKemBq0S9Kz4ojWjaXwBQx
	ArnEi2z9+X9aanMxPh5j+mL8jCBTt+OoCqCIxO+GhDvWG6eHseJQw47RaDnI/Muvhcx5te
	/b5IdvmMIAAWeFGBUfLFX2KOXPdNs4/cqpGid9zBk+J0GVql8WawTgW6Kjk1KA==
Message-ID: <2672a3b6-6457-4460-9e86-895923b80cdc@bootlin.com>
Date: Thu, 11 Jul 2024 10:40:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] leds: pca9532: Use PWM1 for hardware blinking
To: Lee Jones <lee@kernel.org>
Cc: Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
 <20240617143910.154546-3-bastien.curutchet@bootlin.com>
 <b88d211f-3c5b-4428-bd94-3d089c56ed22@bootlin.com>
 <20240711083050.GK501857@google.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <20240711083050.GK501857@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi Lee,

On 7/11/24 10:30, Lee Jones wrote:
> On Wed, 10 Jul 2024, Bastien Curutchet wrote:
> 
>> Hi Lee,
>>
>> On 6/17/24 16:39, Bastien Curutchet wrote:
>>
>>> +static int pca9532_update_hw_blink(struct pca9532_led *led,
>>> +				   unsigned long delay_on, unsigned long delay_off)
>>> +{
>>> +	struct pca9532_data *data = i2c_get_clientdata(led->client);
>>> +	unsigned int psc;
>>> +	int i;
>>> +
>>> +	/* Look for others LEDs that already use PWM1 */
>>> +	for (i = 0; i < data->chip_info->num_leds; i++) {
>>> +		struct pca9532_led *other = &data->leds[i];
>>> +
>>> +		if (other == led)
>>> +			continue;
>>> +
>>> +		if (other->state == PCA9532_PWM1) {
>>> +			if (other->ldev.blink_delay_on != delay_on ||
>>> +			    other->ldev.blink_delay_off != delay_off) {
>>> +				dev_err(&led->client->dev,
>>> +					"HW can handle only one blink configuration at a time\n");
>>
>> I'm having some second thoughts about this dev_err().
>>
>> It was dev_dbg() in V1, but based on your suggestion, I changed it to
>> dev_err() because an error was returned after.
>>
>> I've worked more with this patch since it got applied, these error messages
>> appear frequently, though they don’t seem to be 'real' errors to me as the
>> software callback is used afterwards and the LED blinks at the expected
>> period.
>>
>> Don't you think a dev_dbg() would be more appropriate in this case ? Or
>> perhaps a comment instead of a message ?
> 
> If it's not an error, then don't return an error message.
> 
> Maybe drop the message for a comment and return -EBUSY instead?
> 

OK I'll do this, thank you.

>>> +				return -EINVAL;
>>> +			}
>>> +		}
>>> +	}
>>> +

Best regards,
Bastien

