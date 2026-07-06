Return-Path: <linux-leds+bounces-8946-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WEA8KA/lS2oUcQEAu9opvQ
	(envelope-from <linux-leds+bounces-8946-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 19:25:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EDF713D44
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 19:25:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=KP5EJ8x5;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8946-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8946-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB3F43038AAD
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 17:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794EC38757D;
	Mon,  6 Jul 2026 17:18:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8122D97B7
	for <linux-leds@vger.kernel.org>; Mon,  6 Jul 2026 17:18:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358303; cv=none; b=LWSyclQNAFdH2DeqdngCGyu9OTzlVgZjMKB1iPkTcdFRIbbdsISMYrbTe3J0HBtLUK/NPiVksgUMKn79ATIm6dFyM36dGD3bfLjysC29T+O+l7XHAN0Unk5TYNTHLFhqVGEMCK+XhOhKTpp/a041nMXXNMBXDWMGuJmwnVbC8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358303; c=relaxed/simple;
	bh=YmjH+Y3Kgb9Hbty0PPKiNXVdL4sCaB2vOqcjzHXfyzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwsaDt2pUW+Npe9alT5IwPhOHO8nRx2S8+zGQ/zrROmE+K5r9mEY/ru+xuV7CrIMwdWAeq++cIv2igh9I9B4uDwupKaa52EPrEjo3mR3B6rRRef3i5JghPvYDROrU/svLCPXS19VfNL8i16BHJEdXwKyPeN1RWtOUD1NyS273kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KP5EJ8x5; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-474560436c3so3207619f8f.0
        for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358300; x=1783963100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YmjH+Y3Kgb9Hbty0PPKiNXVdL4sCaB2vOqcjzHXfyzk=;
        b=KP5EJ8x5tLj6T3WH3qG3/lCyzdtqkBQVklvAeqCQ0JQ23FrA0F600viRQhg8X77vji
         qgzB7eQBqqvT92u0Gqz3JMb75o2zzFFEGc2pZDSu4Oj+1RoLKTdZFO+i9QfTIeEd9vgX
         OGGOQzTanZ4DeMZsC8DvFZ4Dnk9Y0UXXhbn11pr82SMI80EEynByb5DWCnrT2CC6BdLf
         cx9+HXDPi5hk0Rm7ZmyGFlJmzzJIVs4brdXZgZ7wnvNSbMofh4bS26KQccZekmpDpCe3
         LCVOgG8V9y4OhYfET2AUX57brxDqCySda1FAglLri2X8SSoi0ORPwysLN2vbG5Td7x9M
         kQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358300; x=1783963100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmjH+Y3Kgb9Hbty0PPKiNXVdL4sCaB2vOqcjzHXfyzk=;
        b=bUqCGTxC9suGgX82pCILv/r/RgEFpamY6JLwvOw54P7Rp49LHcC5+YCDe7F97NkEqm
         K7I0w24NO4qZpxEGBEZDip4rnd/nEmQiwolwG4sIZRUfB/UBSNniX9LKAKCxpd6P7y7W
         am9oCndWBCid7nriAqI0g80852Nr0mxGsrgWTkwxQflbHSFyoa2oNQ2+gg+Pf8sdYyG8
         9ujkxDuy8tisHU1p1bEzyY4P/F29+j0T9VWoj/0UaPjFcXShmoE0pOruPMOb2/M+xTLG
         9WqqSAA8DoMNumv9NIFwq+PZ1wmchlxG3KJdQyne76xy0fnhucauXHflFtb52Hk2lszK
         1oeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1GwCvfHvZfRwegdo2VSKjyZ6Jk7QvvG6N2er0NTEQD30MmQ9b2m7BS0/MEcME/2TyhX37cQvn8YWP@vger.kernel.org
X-Gm-Message-State: AOJu0YwG3VpD9vAtNvpGcwtiaAaXIbLN0eHgOXR/44k65/tQf0DRJe1/
	fb/vFyr85C8AFOBKwjvmNPbTo9JGQXflCB5JY47IRgxgjuC2T1rKwrErriACzM9KQ5c=
X-Gm-Gg: AfdE7ckbwCZ3NSFAR4STeF4gyrUchPYu14/pDi6P5VGd4hCuAMoblyte4r7x7s3al4m
	LnYXsEyvOxp8yRS/oUGpQ7yve3UVNXPLo+DCYEpT496C8g6RPjy5I1vNtiT5cfTH0H+4F4D6CJn
	bQHZLU/Sh7aXiPkANdgX3GGo4P4QgUs8gqiy2XtF4N2ixCNEWjNLAbTq2Zv4hOe4cFhKaIVZIOq
	xdtoFXCkQ3l+LMxR+8HPL0+pclRnbh/sM1mgvEGjuBoBxGkf+xJYHzpwB3Dd3FWgcZoK3DbbsM1
	zu3IU/syweiEc3eKhfWxhJ4mmEGbmDGQ+y9e/XVimDAAQ8NH1zeuCOD9vnf0YO5AXI13lkrYMFX
	WY9pL9oU8yD0xTzYtM5AIeL6kFqJkDFSNL30CFD56lA5RvSu9nKSG+hkXZ1APfYOD8szLcwIBc/
	YOJc1+k4tXna7yn7xwb5vlulkt5gsxe8vl5iCCWEGdVGj8p5Y6GcTDsWxVsk1fH+tTzcIF38JLG
	uU=
X-Received: by 2002:adf:e909:0:b0:475:f0d1:eb5d with SMTP id ffacd0b85a97d-47de66e3e5amr1182516f8f.56.1783358300487;
        Mon, 06 Jul 2026 10:18:20 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039b0cesm26168854f8f.22.2026.07.06.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:18:19 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:18:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Message-ID: <akvjRus_i5ZdqKGC@monoceros>
References: <20260703-ltc3220-driver-v12-0-d4f0da2985e2@analog.com>
 <20260703-ltc3220-driver-v12-2-d4f0da2985e2@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uiv27xnpipz6mahf"
Content-Disposition: inline
In-Reply-To: <20260703-ltc3220-driver-v12-2-d4f0da2985e2@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edelweise.escala@analog.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-8946-lists,linux-leds=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:dkim,monoceros:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03EDF713D44


--uiv27xnpipz6mahf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v12 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
MIME-Version: 1.0

Hello,

On Fri, Jul 03, 2026 at 12:10:51PM +0800, Edelweise Escala wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need.

Thanks
Uwe

--uiv27xnpipz6mahf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL41cACgkQj4D7WH0S
/k5JbAf/cryojVeqrUz0kxo7uqSdT74K5dDv86lDbYDbMwsUBUlKrMUtRiqoeRuB
/meKtGAcJ6Lhtc/EM/kPL13XbuQ4XXUyVqeZcv13kvKwjozPfhJQVvxxz4sAnNZ2
Yxv0z1QkwyvKFTJ2pZzz0ZFPM6t4etJ0/Ufb2jUir2s5+NYlWHQAMTZ7kVPSEFRQ
sAG8GHhJTZAK3YOqnvR1ixHkGn+LUNvy28iZipbEJbsNbmDim5JituncZFTDsipt
eD2dR5fMlrzkmnNneU3QocsdWL1Z+UYPeJXFqe+LCUbB1b/oGOEfOu5vwLALcYhx
7cOcr0mLPD1LAj61L0XPO0W7ik6Bng==
=8rWl
-----END PGP SIGNATURE-----

--uiv27xnpipz6mahf--

