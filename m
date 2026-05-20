Return-Path: <linux-leds+bounces-8230-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECnEAmbIDWr93AUAu9opvQ
	(envelope-from <linux-leds+bounces-8230-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:42:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBAA58FE0E
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 155F6300D36A
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 14:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0FD3A1E89;
	Wed, 20 May 2026 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeeGg82S"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F63EA961;
	Wed, 20 May 2026 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288018; cv=none; b=cd9hgrSqffzPirdXgfkIE44m4eSXcvy5BOU/3W+uzbWZk97au72pGMjqgC3VkGSc4BlkYzx1HeF414O/BLsTOx+XE6JNl4MbWFfv8UB9FbbV9EsnKj35LBVelW+iqylj2U/huAdGA2FT6/TN6FmyXq/i/XE7Do+vbkw6rmbm8qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288018; c=relaxed/simple;
	bh=3pvqXK27qN+PIQVaQwfUXHS7mjwbRkCRNtewr/Gyx2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oLrQ2rUHS97p6YusBdejJSTZOrvM8Suhm3SeU0bzA4gPWSsAXo/wC87tm8ycO5bbIYPsOYXCh8d/DEdbTGmkQg84/wbXGYDm/SJq1HNnUyEmZbjGqJjYSRBDMUFwVuDM/T4m6PqKelL0fvF9SNyMrpLBtGHX0+RyZDCto4BdXP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeeGg82S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45041F000E9;
	Wed, 20 May 2026 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288016;
	bh=z44B4pKlXtWMHeRUWbOBkLIBLTjIsAW+tf1YTZ4aK3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SeeGg82S/X7t2Qu49HzopuqIci+oSF29fTzX26/hxeqpJOuVMwbMUTOO4NnZuhpLT
	 +WJeopmnzMmPd43Pu2aUAW9ZWEOrrL4U4nSls8pzHQp4ERAoL3FWDS7u+y+b4VDNxX
	 9fpGKV3NRReApMZ8Wy6ANZCk+mWrYMvmhlDSbK/SHkGdtEDkyJ0q7wAmaH8gPzdzCS
	 nJeiMy+/0S7eJSIWpjyr4569Tnzkp9VYcQ0UIVBSiEPsUIrEy0yDPoudB6m7GWL397
	 cuYpr8Hl8ZYEJgCzsottFAxvlMYcft9awFND4ioRpHF2wtj71K0Poulun12RrI/Os0
	 llEytgBtpSSLw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Stepan Ionichev <sozdayvek@gmail.com>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260510003632.35942-1-sozdayvek@gmail.com>
References: <20260510003632.35942-1-sozdayvek@gmail.com>
Subject: Re: (subset) [PATCH] leds: dac124s085: declare SPI command word as
 __le16
Message-Id: <177928801545.2818962.8387522912021625579.b4-ty@b4>
Date: Wed, 20 May 2026 15:40:15 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8230-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EFBAA58FE0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 10 May 2026 05:36:32 +0500, Stepan Ionichev wrote:
> dac124s085_set_brightness() builds a 16-bit SPI command word:
> 
> 	u16 word;
> 	...
> 	word = cpu_to_le16(((led->id) << 14) | REG_WRITE_UPDATE |
> 			   (brightness & 0xfff));
> 	ret = spi_write(led->spi, (const u8 *)&word, sizeof(word));
> 
> [...]

Applied, thanks!

[1/1] leds: dac124s085: declare SPI command word as __le16
      commit: e2e0784011e65dc2a0f83eed315c534a70ff5b68

--
Lee Jones [李琼斯]


