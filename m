Return-Path: <linux-leds+bounces-6704-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIvEGBQ3cmmadwAAu9opvQ
	(envelope-from <linux-leds+bounces-6704-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 15:41:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3256808B
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 15:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 066F378C236
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 13:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18832D77F1;
	Thu, 22 Jan 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPP++Ab9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED522A80D;
	Thu, 22 Jan 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769087791; cv=none; b=QZ/x2gQVUDpBF3YPcg0XZfa9YKmoQqXOGo2hd31OGamLH4vowJgFk3/l5hxSzjElrSm8Cs5VCvoq6ttym0TMrvh2e4eVWlnpDtYno0oClP7CeZUrf9vd2M0UI4xN5Px+h+r5751bJ1g+p1bR2CqZDOL1/nLSlnRmH/UA4xfZZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769087791; c=relaxed/simple;
	bh=qlrg3DK7A0Isj0taiC4eo/ebU33Got+rHWhQbOioguM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e0QhG7g/I6WIfCtqfQML+BJ41Z57R21elpMcOX+HjOjkJXnUodrBES7Xlby2elkXFZRQLBvunEai9rDNJlvZ/MkoygjKTWScvUTobzOPqIegFMSwn6eAEleKOLYgWrRBBjZGnMbM8d6LIEfgDIZUTF6clhf/T2CCxVqQop9syl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPP++Ab9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDECC116C6;
	Thu, 22 Jan 2026 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769087791;
	bh=qlrg3DK7A0Isj0taiC4eo/ebU33Got+rHWhQbOioguM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uPP++Ab9zhJeSATQUyad9t/ZxPkM3tYbpxm33RFbdoh8EPf5607/mUEMy6qV2sKau
	 X64rwsZ4DprbEC/3OBhk6nNyt+sLNx8uBCMal29mxsf+PwxdpZfoaE2TXzT3MxfRet
	 fG4ue6EBw1sP9xDtqLuWze+dskNPjifpqSaA3jMpoJbyS/l6k5T++ANS2RaMhUehU8
	 fJ4pKmBLL+RRI/tbqOcV4l3CN46GJGgBsom9Vb2pIxloJF6Is0omqdqkF4P2J3hpVd
	 TeoYKCXH2lpGH28Pvneo49bZEg59SAwGdn6WFM/zGjxnAdocqgTziXjKYHaqutmjKz
	 hZysudhAb/TPw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Lukas Timmermann <linux@timmermann.space>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251201230601.285641-1-linux@timmermann.space>
References: <20251201230601.285641-1-linux@timmermann.space>
Subject: Re: [PATCH v13 0/2] Support for Osram as3668 LED driver
Message-Id: <176908778931.3924443.13772215058963109403.b4-ty@kernel.org>
Date: Thu, 22 Jan 2026 13:16:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-6704-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mouser.com:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B3256808B
X-Rspamd-Action: no action

On Tue, 02 Dec 2025 00:05:59 +0100, Lukas Timmermann wrote:
> This patch adds basic support for the as3668 driver IC via I2C interface.
> The IC is capable of driving four individual LEDs up to 25.5mA per
> channel. Hardware blinking would be theoretically possible, but this chip
> only supports a few set on/off-delays which makes using that feature
> unfeasable, therefore my driver doesn't offer that capability.
> It's intended applications is in mobile devices such as phones,
> tablets and cameras. This driver was tested and is working on
> a google-manta which is running postmarketOS with a near mainline kernel.
> Also there is a patch in the linux mailing list for that device:
> https://lore.kernel.org/all/20251120201958.1970828-1-linux@timmermann.space/
> The register names and values are taken from the official datasheet which
> can be found here:
> https://www.mouser.com/datasheet/2/588/AS3668_DS000196_1-00-1512816.pdf
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: Add new as3668 support
      commit: 1e31ecb73163385b7ca764a97fb350b395bcff3c
[2/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
      commit: 68d2a846952f81cd01331fffdec9a67299b22319

--
Lee Jones [李琼斯]


