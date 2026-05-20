Return-Path: <linux-leds+bounces-8228-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEJ0MuvJDWo33QUAu9opvQ
	(envelope-from <linux-leds+bounces-8228-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:49:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6935900B5
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C4230F35B5
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 14:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01142BE7AB;
	Wed, 20 May 2026 14:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="du42RxH4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDE61F4634;
	Wed, 20 May 2026 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287686; cv=none; b=c+EGfduuVNO0La4Z6MKZHXAUAMRBEBRkS5SuHdwbOp1YqT8gDJG8DiDP3nSew6a4pQ9SXohFeIaH5J5Orpa0tLhrO9sOhEHPGrgDU2j7GE18x2nrgN6gr5US5OioGv1iIkc8q8g0TASxG/OSgCmABauaISC5gvfBU4gNY/QR8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287686; c=relaxed/simple;
	bh=Eih9ohUmcrMv1sDSaZ2K/j5Ohz0HhTUPJN67FCmkFFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e5n6sMnB3jApCIRQCEI7LLyIl2zb/qPiWF1oAORCfSIjizHSFNVvztwNWA9v9QZq1eAJkNuj2o19WOMlwDypT/+KEWa07pToUiSVHGBCIknzkOnlWSPe5/eBtELKQf0VhB4cfmWdelaZxOvwjtmW3hEZaX4+aAMCy9wE3Wl/8UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=du42RxH4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0941F000E9;
	Wed, 20 May 2026 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779287685;
	bh=iwa0F9i/+keh1UQ3MxQA4kdWjS+CC/JZZ8ZD9UCyHSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=du42RxH4+zDMiFL/XoIxxMmrKZWy3UHo3NWEtt1rBAYxPDAyG+4pHV/gPeFrn6knh
	 FDpraGq3F4VUQe8YfFdfHj81TF3bFRc3Rrl+Jv6pJ3Uk53yAQlVFBx3v9wyFQlKnYN
	 khqdedgoDyyox6Fay6HVvmZkPMFR69k2LZsDM6OAVQcpZQPW8HMG60kZnpfanl1KJ2
	 Xn125Ejg0fjFXaK+IySn9+05XdhZ0sDltc/0j+UwOBDReiM10ItPA0c/jDPDghRaou
	 bB1/KFAwCB2AqtiGM0zG2QUXd+UjiSw8UH15tawLybVjnVSaF0MDQ3/fF3fsJtAKmo
	 pweAany3G5UDQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, 
 wse@tuxedocomputers.com, jacek.anaszewski@gmail.com, pobrn@protonmail.com, 
 m.tretter@pengutronix.de
In-Reply-To: <20260509214603.262368-2-W_Armin@gmx.de>
References: <20260509214603.262368-2-W_Armin@gmx.de>
Subject: Re: (subset) [PATCH v4 1/1] leds: Introduce the
 multi_max_intensity sysfs attribute
Message-Id: <177928768282.2811520.3177179770372088870.b4-ty@b4>
Date: Wed, 20 May 2026 15:34:42 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8228-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmx.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2D6935900B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 09 May 2026 23:46:03 +0200, Armin Wolf wrote:
> Some multicolor LEDs support global brightness control in hardware,
> meaning that the maximum intensity of the color components is not
> connected to the maximum global brightness. Such LEDs cannot be
> described properly by the current multicolor LED class interface,
> because it assumes that the maximum intensity of each color component
> is described by the maximum global brightness of the LED.
> 
> [...]

Applied, thanks!

[1/1] leds: Introduce the multi_max_intensity sysfs attribute
      commit: b1a9b7a904af2c793850f83a4801a013a718fc47

--
Lee Jones [李琼斯]


