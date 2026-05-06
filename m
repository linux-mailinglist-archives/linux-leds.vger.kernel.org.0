Return-Path: <linux-leds+bounces-8023-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EGpOr+Z+2ladAMAu9opvQ
	(envelope-from <linux-leds+bounces-8023-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 21:42:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3BA4DFE8B
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 21:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B6693003626
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2026 19:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED9A3382E1;
	Wed,  6 May 2026 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuneFUWW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7742E1722;
	Wed,  6 May 2026 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096572; cv=none; b=M83ezCn+1zWTlFsa4eWrS5R91v2XLoLACFICK1HhQiiTAeT19wKP1gF2dcJv1+VBUk3qPJCkKIPDEyseBQf2bQWASxyUAUur88W3yXixrlNGBjaJyJeqb44S4dhL2B06tNfPo2uMUDCZKwXJX1/8jeI626W+oWlfJ8zxygqQ2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096572; c=relaxed/simple;
	bh=3ROQhKBMqGZa4J8zWB0gtWFkp7WffPdiqeh3o40NAUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKVt7cSlddPS+WSdhPHM6YFyAZ8t/ro0elyU2jkp8ScepXF3ncCxxyYC+cgUHek6E5pnsokgdwWnSJHv8G1ap7fKt0acroeXFiLLOklfpgzqs5xz4W6Wt2lGp6vxbYNOIOCIWY1BycQ1+eN9BALGi31Ft4XUXbxY4DzzdA626Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuneFUWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E237FC2BCB0;
	Wed,  6 May 2026 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778096572;
	bh=3ROQhKBMqGZa4J8zWB0gtWFkp7WffPdiqeh3o40NAUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuneFUWW5qPivTjUlTiv+IdFgTPUMjbTVCAhUxy2CutXuXqKOWwAEY/xX+RYquqM2
	 HEtO1JvmQAbjUfgguxB/PkbObaBESsTPBYgx8pF41hnUsPiH3XYtntS4Xa+wsdxGMm
	 fiUXX4JdjLDZTrVM50DF6r1EUp9VVf/HCWlNMT71n/wrXY33Zbd00Cpf23rg20U/Rm
	 yr0mYL5RuQagJz6F6DfTPyvswNs/Z/FRCIqa+ep2JzmeTBWftEddRDBH8ZHs0MXfPg
	 fStWeu4Vrq5z+c6S9gwaBYyHRM0jgQGMOsQGx5BNs+edsfJwLSx8KTZEBj0td7P0+5
	 6U1cmd6rbrGuQ==
Date: Wed, 6 May 2026 14:42:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, pzalewski@thegoodpenguin.co.uk,
	lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	daniel@zonque.org, linux-leds@vger.kernel.org,
	luccafachinetti@gmail.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: leds: leds-is31fl32xx: Add
 powerdown-gpios property
Message-ID: <177809656918.2995969.7607110407322138109.robh@kernel.org>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
 <20260429154449.730880-4-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429154449.730880-4-jerrysteve1101@gmail.com>
X-Rspamd-Queue-Id: 3A3BA4DFE8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,thegoodpenguin.co.uk,kernel.org,zonque.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-8023-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On Wed, 29 Apr 2026 23:44:47 +0800, Jun Yan wrote:
> The IS31FL32XX series features an SDB shutdown pin.
> Driving it low (active low) places the chip into hardware shutdown mode
> for power saving, while all register contents are preserved
> and registers are not reset.
> 
> Add powerdown-gpios property to describe the GPIO connected to the
> SDB pin of IS31FL32XX series LED controllers.
> 
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


