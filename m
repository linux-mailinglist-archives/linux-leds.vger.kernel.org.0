Return-Path: <linux-leds+bounces-8024-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MwEGWK3+2njDgAAu9opvQ
	(envelope-from <linux-leds+bounces-8024-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 23:49:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACC4E0B94
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 23:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8331D30057BC
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2026 21:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A8F3264F6;
	Wed,  6 May 2026 21:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duoMEFRw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D17325491;
	Wed,  6 May 2026 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778104160; cv=none; b=MQsUzduMuWBc8aCyDA6ZC/YkPjy1CK0dAcgiqwhE9rJte1lICBtlIsZOIjihZsP4Pa9tjf8YWKeDVBZa4XER0pH7n7s+HQ063QCP6BrB7sSvw19M5uuR7vaO5Ic/80mhSABjISGnS/PNR4A7f5Yp2/fggOt+Wf8VzKMQqmxUtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778104160; c=relaxed/simple;
	bh=kaai75P4sHBvfyP5m9fQX/O1M7ANvflzvb/96zLDMmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fw0v4BXPF0t/q0LrzmoYG85TiXcRQJx/G8Uw2k9SgnqkMiPEEg8+K8qbdP9Uc/fEFeDVTfGiNieKOmAvbjhhyJhZhkxEddqVVDOVA+KBAgqL8SkBDXk1GX4wDocaz7DiLqkOK/+Mk1SSIOBeIiZKmTD/NAKBLtqmS7KxDn6EsfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duoMEFRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7A6C2BCB2;
	Wed,  6 May 2026 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778104159;
	bh=kaai75P4sHBvfyP5m9fQX/O1M7ANvflzvb/96zLDMmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duoMEFRwjhQJnhtOX1ZUZ6O6C0fqYCU284nfd1nF6CiZUKzZSdtaDIez6MmEPpUop
	 3FWesyZfiWy0kwubBi1gxzS76BX03s2szuz+Yl2jHHQx2Nz4cogq0guaVhYeRLH+cE
	 ElbO5voumu2tfLEBsXlIdnGZ+zdenuL7UKBR54PJmjYVILmzpdy89n9zwyv/uat4ZW
	 npP/7mmBhkCoBINAwlDwCBAoqDt6ApNR5Ys5/hFLgiUHE/JYjpheiFg+qTFbIte9ID
	 p1FfvNpZi0mSIn5xVn6mwyK7doWlWXiosdoMQIwxZDPGsaAGgUou8GgPU6wceGn+XS
	 SjlkpRdIfGvpQ==
Date: Wed, 6 May 2026 16:49:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
	luccafachinetti@gmail.com, linux-kernel@vger.kernel.org,
	pzalewski@thegoodpenguin.co.uk, daniel@zonque.org,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: leds: leds-is31fl32xx: Add
 powerdown-gpios property
Message-ID: <177810415685.3271172.11733343287673514343.robh@kernel.org>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
 <20260505145354.1267095-4-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505145354.1267095-4-jerrysteve1101@gmail.com>
X-Rspamd-Queue-Id: C1ACC4E0B94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,thegoodpenguin.co.uk,zonque.org];
	TAGGED_FROM(0.00)[bounces-8024-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 05 May 2026 22:53:52 +0800, Jun Yan wrote:
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


