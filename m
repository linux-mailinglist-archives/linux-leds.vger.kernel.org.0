Return-Path: <linux-leds+bounces-6705-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBI3Mi4mcmkVdwAAu9opvQ
	(envelope-from <linux-leds+bounces-6705-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 14:29:18 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3964867494
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 14:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5A1D4F1E52
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 13:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1512FC01B;
	Thu, 22 Jan 2026 13:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az2rfVpB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2276B2F9C32;
	Thu, 22 Jan 2026 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769087794; cv=none; b=VxrrC3luTztSLmHG1CXig6z5OSqerwK3XUIOLsFEBJBlLsNsBYYaZk6oQdQ103ltp8pR9y3DEV3zJLYAEhzMHAdjuAMDiQU6Cmgd7/f2/B8BraD6aJR1EHgvFbPVgCa6RI0bjZKpmT6LvobNheCU3bkxlwDGPRrayhw8a4wI740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769087794; c=relaxed/simple;
	bh=xuBJGovRTjVshbSibhalxYLDBXqf9Ynp6pxi7FKmm7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q6pB0Sp+ihI6Z2UJdhkWJT3caIEA2l5K93HKyeNjObLKgzA4tU4HrKQUWogyDaUTDt+mqLS42bD7+Ir/+lTBYtayU40DrUE94LtkaDVQjnJdYZnFVLec6b2NCg500ooBMJi1hGOupLhnWFQYwKgjuC0QUpbteGFFQBBI+S4BbdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az2rfVpB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067D1C116C6;
	Thu, 22 Jan 2026 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769087793;
	bh=xuBJGovRTjVshbSibhalxYLDBXqf9Ynp6pxi7FKmm7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Az2rfVpBc7tAwcyH0+rZeVrrBVOjuPCiDUWEVoPM1G+6ETjJHKlCdnARMg0IXUVpa
	 JmjkZr5jYeEQE/0suItei7tqULmfWLQaHszGT4KXneis5mXJ+QBSH+L2hvH0ksXczL
	 ubRqbGAfnPClZvce6wsSxPVwR5ySJJIS6CZfAsa2KoyaTcOWArUJVGLYazCHervIro
	 ex62MApbo45M18nMX+9eXhCv7Lpkez0lSEzDXruxgdUHkEOf5F89C+IXS/WG7FRD0C
	 Hk9M09YYHqIMFdiWZybIPpxa5y1owqLuiYOSAU9dIb+rQA5yf3n17Hmqqyakelko34
	 Tt/tHnfyn0uHg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Lukas Timmermann <linux@timmermann.space>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260118165010.902086-1-linux@timmermann.space>
References: <20260118165010.902086-1-linux@timmermann.space>
Subject: Re: [PATCH v14 0/2] Support for Osram as3668 LED driver
Message-Id: <176908779171.3924443.2834922090007850430.b4-ty@kernel.org>
Date: Thu, 22 Jan 2026 13:16:31 +0000
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
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-6705-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3964867494
X-Rspamd-Action: no action

On Sun, 18 Jan 2026 17:50:08 +0100, Lukas Timmermann wrote:
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


