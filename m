Return-Path: <linux-leds+bounces-8898-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 04W/DSEJR2oMSgAAu9opvQ
	(envelope-from <linux-leds+bounces-8898-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 02:58:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8626FDAA4
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 02:58:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XetlJrW0;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8898-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8898-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1921A302F71C
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 00:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FA922538F;
	Fri,  3 Jul 2026 00:57:42 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3BF18C332;
	Fri,  3 Jul 2026 00:57:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783040262; cv=none; b=DrVu7xF8vRDfuCzm4jHLbtMm3Bfy8DOJWfjPUEd8+wUoyp//0DpbKOtr5krjRxeSeXGAaXEL7pXYcSnm9IMS6mbBdasnUcnMCYL0coTTxq7+Az1szrDYkyYtPk7AEleHJ9CmycfwdOh26u0kAoakNKCVbR/f58vf7goedWOmzj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783040262; c=relaxed/simple;
	bh=8tWo6Q0644PyRF7YBZcu76mfXlMXySY0t9qyIdZP05k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j47xDc0TDZS+tHII/MYYYRPHXO6jWBdXAvMp7ModFhhZsFPm6iY6RttfiTgpF/2ZYvgNUZUfLTxJjROsr2yd5tE45wN5Y7UsDmTSbTLVjnASWlDSVUwStAp0oKB7Q5vVMa2WF23DRgwUlDvNFWAUGo6tNh83lIR24rTTorj6Zqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XetlJrW0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5194C1F00A3A;
	Fri,  3 Jul 2026 00:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783040260;
	bh=dgOSzXi3H3wJeZW1ociIAvvOzPFpS+FmJNkakpTdycU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XetlJrW020pJ2/NodgckE91pFr2iY+JQaacOLVnDqnPf4tkEAprlnkwak07XsOePW
	 GvKmsk6KS9YdrF0BoQkJZHJjCgzCeHre65sz0qfKZGuCx5IluCAsrGQ6bsy2hgr7yF
	 hc8u4QhVJcG5JD3ZKHG52W1KqvVFm7Rpjb68FSpLd+aqc5upA0AZVKd50bYYqiRK2G
	 vM0MhPb/6ACRq7DO3mT6kRpQ7hUR1B4iz4z7sjgCtIPAJV8tRL1058fJOBf684uxRA
	 J3s8i5JyuMmFUU1NHFCEI6QZrTZ3MQcoVX3xYV36HXV8dFPEG08Hoy0J6fns67rtcM
	 TQ+OFVo9iheLQ==
Date: Fri, 3 Jul 2026 01:57:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 05/14] iio: light: lm3533-als: Remove redundant pdata
 helpers
Message-ID: <20260703015735.1403d1de@jic23-huawei>
In-Reply-To: <20260617080031.99156-6-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
	<20260617080031.99156-6-clamor95@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8898-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A8626FDAA4

On Wed, 17 Jun 2026 11:00:22 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> The lm3533_als_set_input_mode() and lm3533_als_set_resistor() functions
> are used only in lm3533_als_setup(). Incorporate their code into
> lm3533_als_setup() directly to simplify driver readability.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
LGTM
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

