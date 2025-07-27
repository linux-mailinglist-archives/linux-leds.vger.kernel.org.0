Return-Path: <linux-leds+bounces-5143-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F15B131F8
	for <lists+linux-leds@lfdr.de>; Sun, 27 Jul 2025 23:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F25E7175846
	for <lists+linux-leds@lfdr.de>; Sun, 27 Jul 2025 21:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E86E23AE9A;
	Sun, 27 Jul 2025 21:14:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3A81A5B8B;
	Sun, 27 Jul 2025 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753650880; cv=none; b=fnemimHeEHXUfsDwHGwT3RCj3qI5iN7aEk/zCdxVNLRDLfhdZCzFfe1EPz/wp4n+EUnB3AaL21KV2pVIRVZcCcZilRJV7ATg1wzVLfx0iPElPWTA3N4EWQdCKtYhQTnu0qhrpPPcgMeYZzCwmtd3ktsJ790Jg2WPq9kgjl7xDXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753650880; c=relaxed/simple;
	bh=CBR+53Y/DZCR99QXroUPsoa0S2HPWBF+r1FSKNw2o3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlJyu0ADXq8yVV3VBDxZFnXjdUC3W6BwMzvQAlPh01CT7kh5ak4WMZk88U56ExTwZrueah3cFabm4srOhVDVvLjNrA3V1TpPAwbxjuBiFVYXF2X+jQIRX026EbvdH8HgkJdmb79z6dhNjKpVo3opMirWEP3/erWgrTuq1lY2o/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bqvW72P7Vz9v5k;
	Sun, 27 Jul 2025 23:14:27 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=linux@timmermann.space
Message-ID: <0bd74dc6-808e-464d-bfb3-c0c7296b5d96@timmermann.space>
Date: Sun, 27 Jul 2025 23:14:24 +0200
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
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4bqvW72P7Vz9v5k

On Sun, 23 Jul 2025, Lee Jones wrote:
 >
 > How many REVs can one chip have?
 > Would be 4-bit/16. I thought I do a little check about the revision 
and print a warning message to inform about the probably untested 
revision. Or is that not necessary?
Removing the REV constant results in an if-statement similar to
if(rev == 1). Is this considered a magic number?>> +static int 
as3668_read_value(struct i2c_client *client, u8 reg)
 >> +{
 >> +	return i2c_smbus_read_byte_data(client, reg);
 >> +}
 >> +
 >> +static int as3668_write_value(struct i2c_client *client, u8 reg, u8 
value)
 >> +{
 >> +	int err = i2c_smbus_write_byte_data(client, reg, value);
 >> +
 >> +	if (err)
 >> +		dev_err(&client->dev, "error writing to reg 0x%02x, returned 
%d\n", reg, err);
 >> +
 >> +	return err;
 >> +}
 >
 > These look like abstractions for the sake of abstractions.
 >
 > Just use the i2c_smbus_*() calls directly.Should I omit the write 
function as well? I do some error handling there. Is it okay to err |= 
write() the returned error codes in init or should I handle every 
possible write error by itself?>> +	/* Read identifier from chip */
 >> +	chip_id1 = as3668_read_value(client, AS3668_CHIP_ID1);
 >> +
 >> +	if (chip_id1 != AS3668_CHIP_IDENT)
 >> +		return dev_err_probe(&client->dev, -ENODEV,
 >> +				"chip reported wrong id: 0x%02x\n", chip_id1);
 >
 > Unlikely.  This too is unexpected, as above.
 > Error message not descriptive, understood. Changing that to 
"unexpected ..." as above. Or am I misunderstanding and the check should 
be omitted entirely?>> +	/* Check the revision */
 >> +	chip_id2 = as3668_read_value(client, AS3668_CHIP_ID2);
 >
 > Is child_id2 not for another chip?
 >
 > This is ambiguous, please improve the variable nomenclature.
 > chip_id2 is directly related to the defined register CHIP_ID2 which 
name is taken from the datasheet of the AS3668. (Not sure if I'm allowed 
to link it)
Should we diverge from the datasheet in case of naming?
Or is only chip_id2 to be renamed, even tho it holds the values of 
CHIP_ID2? I would consider chip_ident for chip_id1 and chip_subident for 
chip_id2. chip_subident would break down into chip_rev and chip_serial.
Of course reading chip_id2 would be unnecessary if I omit checking the 
revision in the first place (see above).>> +	err = as3668_dt_init(as3668);
 >> +	if (err)
 >> +		return dev_err_probe(&client->dev, err, "failed to initialize 
device\n");
 >
 > No need for 2 error messages.
 > Doing if(error) return error; then...?

Thanks for the input. I'm willing to learn. :)

Lukas Timmermann

