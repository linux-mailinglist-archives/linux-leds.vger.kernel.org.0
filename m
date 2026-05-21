Return-Path: <linux-leds+bounces-8270-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGGhDaK5DmrBBgYAu9opvQ
	(envelope-from <linux-leds+bounces-8270-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 09:52:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C17A5A0614
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 09:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28334300B8C0
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 07:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDCE33BBAF;
	Thu, 21 May 2026 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtv1eZbJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4C23164C5;
	Thu, 21 May 2026 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349617; cv=none; b=PGvX8bzrDS6zQxAMFd6TA7aP7KnjwGTzY4Lz72TMaAZE63PNye16TaYBMVYprbGYEG9SY9x0+BQ0XG/qveFgsthMrwq35Jwao90TxvCdwp5dGJBbnrTsbnK8WOodrShBVNv8vYiw4pyVip0RaRN0Ct5fzM/jsg8M8Mb0CHdzBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349617; c=relaxed/simple;
	bh=5NcAJUBJXJBP5NdE3DM/Qan396Y9yRH8RJfWZQaAQog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/59UPRcx70gtplfj9GDR9UMCHOA3Qy4ZuORu5+wpJpl9R7jltyPBwM7x2v18go9BHolnj+t03kWopmlTruQdj9f/QhUjUEfeov5WReA/+4ovZbNnBbYFhD2vt1jA+Vw7M24aqF+S8MqRNBltWvieV9qcl+chNnnvMYYvKtUc08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtv1eZbJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98A01F00A3C;
	Thu, 21 May 2026 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349616;
	bh=e8I4CxLDkCmUbFh/qWstl9SIHgQG5L8IDZVJv+986Q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mtv1eZbJqfWH8yWHJYbyk9Al9MuEAALfXDgKM/FMlDMnblktLg/th1+TrgolBOJO3
	 BUKZeFpyeBzk8VaoRTg4Kd77XcAB+hkEPOhB3ZrMmMC6QNAdy1qx086rJdp2SQnWXp
	 ueVlU54xfg3OSn9JT+Cw+JVfivtqgFjO65AVppzUeKKaHGkQxbWihP5TSDoHyreskO
	 G5oAAe2lIge3p1LrhPSWfcxReUZcDFvX559y+NwE5wkdn6WMV1PyRdqdREO/VKmr3q
	 vs1A3cxrlGMbmneMCqEfxfv6qTCh9lpkqkubfIiLeBENiOrusP9Wnuma3ZAgS3dRZF
	 qbvWXHlYQhe2g==
Date: Thu, 21 May 2026 09:46:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, luccafachinetti@gmail.com, pzalewski@thegoodpenguin.co.uk, 
	daniel@zonque.org
Subject: Re: [PATCH v7 1/6] dt-bindings: leds: issi,is31fl32xx: convert the
 binding to yaml
Message-ID: <20260521-warm-magenta-sawfly-ae8bc0@quoll>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
 <20260520135659.1430008-2-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520135659.1430008-2-jerrysteve1101@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8270-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,thegoodpenguin.co.uk:email]
X-Rspamd-Queue-Id: 1C17A5A0614
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:56:54PM +0800, Jun Yan wrote:
> Convert leds-is31fl32xx to DT schema format.
> 
> Co-developed-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/leds/issi,is31fl32xx.yaml        | 151 ++++++++++++++++++
>  .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
>  2 files changed, 151 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


