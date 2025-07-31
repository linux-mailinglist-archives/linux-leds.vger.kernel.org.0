Return-Path: <linux-leds+bounces-5181-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5058B170AA
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 13:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 216FB584F4C
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 11:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109822C327F;
	Thu, 31 Jul 2025 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWRtu991"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BBF2C08DB;
	Thu, 31 Jul 2025 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753962722; cv=none; b=i9k+B5YyK+J2F5VL0JdoFXTvho7dRC1kaS8W+C06gTr1onNVijJwvcimkPjLgbzd/WGj22QTGZHmYwWX/O1ar9A6J5ZMCFuL+UUoJDsBMN0AvpxfFhZo6TfQJnYPTsZzH1ll95avLyQDOT4IXIidY2RCYULNFH0wVsU4JWaOs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753962722; c=relaxed/simple;
	bh=Z83uWHM+h223rV4Zk4J8by6vpmxft3lhwsCh7wcDG1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edRe6EKTaqs2OBaTHL6wxOrsKghvuaBn5dbFbO3iyLPhIOu4lYg1hoc/d3r4J/UCDYIXF0Td/06tcKN076gAn31haL7aILaUKK0EeRifUnzIG4K2wp1hBwGvlNCK16eL8KkUHeWp8hMiUOZz6JnZTHi4Wy+PRv9jQdoiQUBem+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWRtu991; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918BEC4CEEF;
	Thu, 31 Jul 2025 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753962721;
	bh=Z83uWHM+h223rV4Zk4J8by6vpmxft3lhwsCh7wcDG1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWRtu9919bXLAuc8u4SEP7dZPQ4aengs3q/wqG8zTS4R+yDqmljGznFziysZi1/0+
	 sGi8f6KCq+Xf/uNHEZqqR2rJA4aI+S7KQaiv+fyC1uI2nzidqZFXi8nX7yR++pQYvY
	 zDPDh+3jw99WBsbm1Fxjz4hki88/SFYwOvu0UHRR2m9RQ9IND6D3SxBQOpA9zgOF2+
	 GNT0VZwVXdPw4j6n3yrZVUKs0ZtcZD/KpTPAbJy5PEmw7z/cqnBtrHPLYTy0JuYPbG
	 nGUHo9hBMEerWS5IQ3nwata/IJnsLesmFLU+G5/fp2WF0rWgR23MDf65nHM0z4fmkF
	 n2l8FxiHYIa5g==
Date: Thu, 31 Jul 2025 12:51:56 +0100
From: Lee Jones <lee@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <20250731115156.GF1049189@google.com>
References: <20250708141114.134950-1-linux@timmermann.space>
 <20250708141114.134950-3-linux@timmermann.space>
 <20250723093108.GQ11056@google.com>
 <a028730a-a51c-4595-992e-e1e082329850@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a028730a-a51c-4595-992e-e1e082329850@timmermann.space>

On Sun, 27 Jul 2025, Lukas Timmermann wrote:

> Formatting was malformed in the last message, sorry. Next try:
> 
> > > +#define AS3668_CHIP_REV1 0x01
> > 
> > How many REVs can one chip have?
> > 
> Would be 4-bit/16. I thought I do a little check about the revision and
> print a warning message to inform about the probably untested revision. Or
> is that not necessary?
> Removing the REV constant results in an if-statement similar to
> if(rev == 1). Is this considered a magic number?

I would omit this until there is another revision.

> > > +static int as3668_read_value(struct i2c_client *client, u8 reg)
> > > +{
> > > +	return i2c_smbus_read_byte_data(client, reg);
> > > +}
> > > +
> > > +static int as3668_write_value(struct i2c_client *client, u8 reg, u8 value)
> > > +{
> > > +	int err = i2c_smbus_write_byte_data(client, reg, value);
> > > +
> > > +	if (err)
> > > +		dev_err(&client->dev, "error writing to reg 0x%02x, returned %d\n", reg, err);
> > > +
> > > +	return err;
> > > +}
> > 
> > These look like abstractions for the sake of abstractions.
> > 
> > Just use the i2c_smbus_*() calls directly.
> > 
> Should I omit the write function as well? I do some error handling there. Is
> it okay to err |= write() the returned error codes in init or should I
> handle every possible write error by itself?

The handling in write() is standard error handling.

It doesn't justify another function.

> > > +	/* Read identifier from chip */
> > > +	chip_id1 = as3668_read_value(client, AS3668_CHIP_ID1);
> > > +
> > > +	if (chip_id1 != AS3668_CHIP_IDENT)
> > > +		return dev_err_probe(&client->dev, -ENODEV,
> > > +				"chip reported wrong id: 0x%02x\n", chip_id1);
> > 
> > Unlikely.  This too is unexpected, as above.
> > 
> Error message not descriptive, understood. Changing that to "unexpected ..."
> as above. Or am I misunderstanding and the check should be omitted entirely?

No, that's fine.

> > > +	/* Check the revision */
> > > +	chip_id2 = as3668_read_value(client, AS3668_CHIP_ID2);
> > 
> > Is child_id2 not for another chip?
> > 
> > This is ambiguous, please improve the variable nomenclature.
> > 
> chip_id2 is directly related to the defined register CHIP_ID2 which name is
> taken from the datasheet of the AS3668. (Not sure if I'm allowed to link it)
> Should we diverge from the datasheet in case of naming?
> Or is only chip_id2 to be renamed, even tho it holds the values of CHIP_ID2?
> I would consider chip_ident for chip_id1 and chip_subident for chip_id2.
> chip_subident would break down into chip_rev and chip_serial.
> Of course reading chip_id2 would be unnecessary if I omit checking the
> revision in the first place (see above).

I would encourage people to match up defines with the datasheet.

Variables should instead be easy to read / maintain.

> > > +	err = as3668_dt_init(as3668);
> > > +	if (err)
> > > +		return dev_err_probe(&client->dev, err, "failed to initialize device\n");
> > 
> > No need for 2 error messages.
> > 
> Doing if(error) return error; then...?

Right.

-- 
Lee Jones [李琼斯]

