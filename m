Return-Path: <linux-leds+bounces-6311-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA419C850EF
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 13:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5CB364E9578
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 12:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF6A321456;
	Tue, 25 Nov 2025 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUAalPFm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928712D8363;
	Tue, 25 Nov 2025 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075529; cv=none; b=W1AsVDR9ztT5HtMg5R4e09uI+CgqbqK/WNeUp/ZK7G1hwWUShZj9O7jXfBiHcJP/aPr936e6dO9eCp6YEBnL3O6qLsDuYGkF9YYvit2pyHn/8JFqGcorMIa/iKEpgRspdI/nsmtEGK2MSdGPueA8/BpIS5S6Ect9An1NeoJ797k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075529; c=relaxed/simple;
	bh=u8F21xXVO3lW2+k9EOsFAJ9mPFYDVMjWnE0952aUtZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7MYt3sZ4DX5oaHeUUM+hviSYRP8Sx/cmU/AelCV/Je2SGLRhPWHMy0fs26puEMl6fAQD5JOZenNZL2lyUjDUBavynomOeUMjItwj215UHmULl8pNNWSOoxG9aU+6LfAoE55hp90sMs6QijjidXxSmCdi4ZdxGYYAUOY//6g8QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUAalPFm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D474C4CEF1;
	Tue, 25 Nov 2025 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764075527;
	bh=u8F21xXVO3lW2+k9EOsFAJ9mPFYDVMjWnE0952aUtZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WUAalPFmfR+iRTY0DGX+ATuVmZRFYaUVyFK5aTXFawgPRuyBiEQl89bmP9EvdJc0e
	 eEzNfxyG50SHoPprURiesOZUr+b8bcB3sUbeXWS9sJFSBP6bNgFslia4geRimcjmN3
	 iMnte2UCRy2XctdwqilQr1FuvmlLVKHL6SQ5aYi7IiAAPBJ9kwQ00Bv9phO0ONi0Rd
	 ScxdxgFom4F8rhG7ku8+sAGE9r96v0HUXOj4FZ5QnkT7nP2F+X/T9QjJZGuAtaEi27
	 XFnCFMe+7wkh9M/kLvNUf8zve8YRA1eNL+8gBHuD81UMey1R4pjgeYdcNUEhbh4bRs
	 sgyItTdj9TthA==
Date: Tue, 25 Nov 2025 12:58:42 +0000
From: Lee Jones <lee@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <20251125125842.GB1127788@google.com>
References: <20251117020008.316648-1-linux@timmermann.space>
 <20251117020008.316648-3-linux@timmermann.space>
 <20251120120704.GC1949330@google.com>
 <gk6v5x5jwapaafsppq2svukviidibvsmdwwp2vizfd7yetb5fh@gaov2dqfxp34>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gk6v5x5jwapaafsppq2svukviidibvsmdwwp2vizfd7yetb5fh@gaov2dqfxp34>

On Fri, 21 Nov 2025, Lukas Timmermann wrote:

> On Thu, Nov 20, 2025 at 12:07:04PM +0000, Lee Jones wrote:
> > On Mon, 17 Nov 2025, Lukas Timmermann wrote:
> > 
> > > Since there were no existing drivers for the AS3668 or related devices,
> > > a new driver was introduced in a separate file. Similar devices were
> > > reviewed, but none shared enough characteristics to justify code reuse.
> > > As a result, this driver is written specifically for the AS3668.
> > > 
> > > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > > ---
> > >  MAINTAINERS                |   1 +
> > >  drivers/leds/Kconfig       |  13 +++
> > >  drivers/leds/Makefile      |   1 +
> > >  drivers/leds/leds-as3668.c | 222 +++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 237 insertions(+)
> > >  create mode 100644 drivers/leds/leds-as3668.c

[...] 

> > > +	if (reg < 0) {
> > > +		dev_err(&as3668->client->dev, "failed to read channel modes\n");
> > > +		return;
> > > +	}
> > > +
> > > +	switch (led_id) {
> > > +	case 0:
> > > +		reg &= ~AS3668_CURR1_MODE_MASK;
> > > +		reg |= FIELD_PREP(AS3668_CURR1_MODE_MASK, mode);
> > > +		break;
> > > +	case 1:
> > > +		reg &= ~AS3668_CURR2_MODE_MASK;
> > > +		reg |= FIELD_PREP(AS3668_CURR2_MODE_MASK, mode);
> > > +		break;
> > > +	case 2:
> > > +		reg &= ~AS3668_CURR3_MODE_MASK;
> > > +		reg |= FIELD_PREP(AS3668_CURR3_MODE_MASK, mode);
> > > +		break;
> > > +	case 3:
> > > +		reg &= ~AS3668_CURR4_MODE_MASK;
> > > +		reg |= FIELD_PREP(AS3668_CURR4_MODE_MASK, mode);
> > > +		break;
> > > +	default:
> > > +		return;
> > > +	}
> > > +
> > > +	err = i2c_smbus_write_byte_data(as3668->client, AS3668_CURR_MODE_REG, reg);
> > 
> > Either it's an error or it's not.  Why isn't it being propagated?
> > 
> My patch had a dev_err() call here. It's missing in your citation.
> Was using dev_err() here wrong?

Yes.  It's preferable that you propagate (return) the error.

If you don't do that, it's just a warning.

-- 
Lee Jones [李琼斯]

