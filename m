Return-Path: <linux-leds+bounces-5144-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18770B131FD
	for <lists+linux-leds@lfdr.de>; Sun, 27 Jul 2025 23:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437721895E80
	for <lists+linux-leds@lfdr.de>; Sun, 27 Jul 2025 21:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFC923C4FB;
	Sun, 27 Jul 2025 21:23:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DE728FD;
	Sun, 27 Jul 2025 21:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753651398; cv=none; b=L6mz1zJ4f4jzl8pX9L/AdwMlfOCkVfrLCV2hoAWYR/KRgYH+E2sCr2DbV46KFMJsGVeA9jOXsUL4sZt05vjlOV1B4mlrMflezNxmWRtMlpnYtMqRYL6iQSndKGh4k3wozuQI1kYSiQkiwBNh9JrtI+DU0DlrNU46aaJfHNSMKkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753651398; c=relaxed/simple;
	bh=xt0AZUVHMpD8vl17PbgkUvXZb6kbkI35v/akkyB+Dqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSc7SuP9RT7FkBqk3DuYGDe5KCQNz5vjRoLElPJl04tvFhmvxpRgIW3bDIXPqLfxKYsw0qhev72seveZ+KuLwnsWTulsG654znpH2j6rFQRkH7OE3lAoX8WzfOR8kZvlhZlOJ1f0Bk4Px+khLdv74pAVWLIbWbieNrdwDIgc0Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bqvjD3YSKz9tkV;
	Sun, 27 Jul 2025 23:23:12 +0200 (CEST)
Message-ID: <a028730a-a51c-4595-992e-e1e082329850@timmermann.space>
Date: Sun, 27 Jul 2025 23:23:10 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250708141114.134950-1-linux@timmermann.space>
 <20250708141114.134950-3-linux@timmermann.space>
 <20250723093108.GQ11056@google.com>
Content-Language: en-US, de-DE
From: Lukas Timmermann <linux@timmermann.space>
In-Reply-To: <20250723093108.GQ11056@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Formatting was malformed in the last message, sorry. Next try:

>> +#define AS3668_CHIP_REV1 0x01
> 
> How many REVs can one chip have?
> 
Would be 4-bit/16. I thought I do a little check about the revision and 
print a warning message to inform about the probably untested revision. 
Or is that not necessary?
Removing the REV constant results in an if-statement similar to
if(rev == 1). Is this considered a magic number?
>> +static int as3668_read_value(struct i2c_client *client, u8 reg)
>> +{
>> +	return i2c_smbus_read_byte_data(client, reg);
>> +}
>> +
>> +static int as3668_write_value(struct i2c_client *client, u8 reg, u8 value)
>> +{
>> +	int err = i2c_smbus_write_byte_data(client, reg, value);
>> +
>> +	if (err)
>> +		dev_err(&client->dev, "error writing to reg 0x%02x, returned %d\n", reg, err);
>> +
>> +	return err;
>> +}
> 
> These look like abstractions for the sake of abstractions.
> 
> Just use the i2c_smbus_*() calls directly.
> 
Should I omit the write function as well? I do some error handling 
there. Is it okay to err |= write() the returned error codes in init or 
should I handle every possible write error by itself?

>> +	/* Read identifier from chip */
>> +	chip_id1 = as3668_read_value(client, AS3668_CHIP_ID1);
>> +
>> +	if (chip_id1 != AS3668_CHIP_IDENT)
>> +		return dev_err_probe(&client->dev, -ENODEV,
>> +				"chip reported wrong id: 0x%02x\n", chip_id1);
> 
> Unlikely.  This too is unexpected, as above.
> 
Error message not descriptive, understood. Changing that to "unexpected 
..." as above. Or am I misunderstanding and the check should be omitted 
entirely?

>> +	/* Check the revision */
>> +	chip_id2 = as3668_read_value(client, AS3668_CHIP_ID2);
> 
> Is child_id2 not for another chip?
> 
> This is ambiguous, please improve the variable nomenclature.
> 
chip_id2 is directly related to the defined register CHIP_ID2 which name 
is taken from the datasheet of the AS3668. (Not sure if I'm allowed to 
link it)
Should we diverge from the datasheet in case of naming?
Or is only chip_id2 to be renamed, even tho it holds the values of 
CHIP_ID2? I would consider chip_ident for chip_id1 and chip_subident for 
chip_id2. chip_subident would break down into chip_rev and chip_serial.
Of course reading chip_id2 would be unnecessary if I omit checking the 
revision in the first place (see above).

>> +	err = as3668_dt_init(as3668);
>> +	if (err)
>> +		return dev_err_probe(&client->dev, err, "failed to initialize device\n");
> 
> No need for 2 error messages.
> 
Doing if(error) return error; then...?

Thanks for the input. I'm willing to learn. 🙂

Lukas Timmermann

