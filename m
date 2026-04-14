Return-Path: <linux-leds+bounces-7724-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NGGNc9r3mm5EAAAu9opvQ
	(envelope-from <linux-leds+bounces-7724-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 18:31:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4563FC970
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 18:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 713D3307BA70
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 16:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9656C3ED5A3;
	Tue, 14 Apr 2026 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Le96GiwR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719373ED13B;
	Tue, 14 Apr 2026 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183940; cv=none; b=OWfFi2pnUCLtsVPEIbGqNM0IcpAjEg/LfyMQT3VVmFJ5CDWeLNrOPueBZRJsX/b8DTcs+5HFdavPO6Hw76sLLq4f6rh0/UVW3G+UuktIMgK6wc3Rs8DEccaPjGCtcgEzdx+UcUqeb4zlyIJhxZgj5aXBv6eHouDXY56J2pezCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183940; c=relaxed/simple;
	bh=oXPr6DICSQAjrstqrDQl8dHMx2EjDycoyikzXqoN0vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3f+F9wh+fD8Czf2DKBFl29piMpyf/DIBnyAnEVeTzrJHSShYab+BNgdcxDgJjAGqF805hw5tmFuh/r8LexYBmPyLUAK9rKmJ6D8dN6BYXl+cM4cJ+kfexV02gORRLqqEYTjVOAvmHvQl1EMRZKWWiEqBatioNJFFECEpWncvGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Le96GiwR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FDAC19425;
	Tue, 14 Apr 2026 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776183940;
	bh=oXPr6DICSQAjrstqrDQl8dHMx2EjDycoyikzXqoN0vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Le96GiwRQmFJpXkrBR1cBOh46m9m12Vv3tth2mtOZn+E/McBgQSC6NTjAm3pzLW8F
	 HTB8OQYqn0LsCwhhCQOu2J8aE33FBef3DHAaVo392gLOBXzSnaitm2oBHKo0vQD8Po
	 Gl1rA8URvIDp06I51J74CENBcfomdPB+K3F535Nm4XQV9PFfN5lv8VWWXeYWZr7O4w
	 KMwe+I1EVfiZfEzGc3xiNhyMnmIW/YjWfjirDW9j7jG8+TVN/s3C+tqlX8c9M2Y8ar
	 zE9Sw31MS0sN9owOuR10RezkhbtR1oyGp6jk3jH0vAaeifMMmbVOkVZQ94GSMRI2fD
	 Q1PBd8udugN3A==
Date: Tue, 14 Apr 2026 17:25:32 +0100
From: Daniel Thompson <danielt@kernel.org>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <ad5qfDzaHZhjZsLs@aspen.lan>
References: <20260407-max25014-v8-0-14eac7ed673a@gocontroll.com>
 <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7724-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,nxp.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielt@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,gocontroll.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D4563FC970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 04:41:42PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

