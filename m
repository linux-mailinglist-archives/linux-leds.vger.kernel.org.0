Return-Path: <linux-leds+bounces-8809-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l2duGJ/JQ2rDhwoAu9opvQ
	(envelope-from <linux-leds+bounces-8809-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 15:50:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D16E50BD
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 15:50:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nhYqmEaN;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8809-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8809-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A08C302EEA1
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 13:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FFF366066;
	Tue, 30 Jun 2026 13:50:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38B23D7DF;
	Tue, 30 Jun 2026 13:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827421; cv=none; b=gOrMKHn4lZVi+Sl2jDQmrW6mFAEJwt1iTMkgRgUCun3FWq0QVOgh07m81gi03MrgNrCFqdGuaxyXX4s2SArQpJgBZKwKsz5LC806Q8FXXofOgJRqCk2Tl55WOt8OpGFNE7mwAYLT8yGeGxHakWmTRgMVmlBS9Zl0PRwWkeHN8Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827421; c=relaxed/simple;
	bh=wKKfI6rfHepZWj931Iie8JnqM3m9gU1e0VmuJG7Mgmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnYi3m50xoHDCHHd73LUZxQv7ADp25AbrRvX3Pnd49eSkKC7lGBbK+aApHyiKXesn1Lni4ahZhkMrhQ5ac4pSub9IRbe6/eNQHBwjmMdbUD42fSWb5qCITck1Ehuu5lLQvCFdYtXXeGDkr89rX987R9u3r3/7YtYJrVm1v6c8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhYqmEaN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CFF1F000E9;
	Tue, 30 Jun 2026 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827418;
	bh=r5/XEfDRgRNyeD3IF0mg0cZuaZMASN03u9kVorM3GNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nhYqmEaN4wmBNsZUU8bKra5Imi5s/cf3NZTFsYJHnC9ANATTSlzBlyiq15+sOcFBf
	 hH3EEr9IiReV4GshzevMtkVog9DbbxPJbfkLn6q/mhhwLi8qffyASXUGZ9V3Q0YiKG
	 jGmGKjX9qFvlLR3zH6VX8aumoTt9j+QBqVERLcpG5XXaDGjegKba4+2jSCoRLvHuAD
	 9UPmRGRC3lrVz/FJBPfWWCnzj7EsL3OyzN0p3APlsVDRHRt8Rd8QY8izt/AxXOasor
	 I0/PobwDtqMJEsUy3y8Ls9v9o+AYIxZOOdmTOe5/c3mK2FIy+0fe6eyYy40tP2pp3/
	 oE1970hKzUkzA==
Date: Tue, 30 Jun 2026 08:50:17 -0500
From: Rob Herring <robh@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Andrew Davis <afd@ti.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: backlight: ti,lp8864: Add backlight
 class properties
Message-ID: <20260630135017.GA2948054-robh@kernel.org>
References: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
 <20260615120353.3409035-2-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615120353.3409035-2-alexander.sverdlin@siemens.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8809-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexander.sverdlin@siemens.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:afd@ti.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,gmx.de,ti.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,ti.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F31D16E50BD

On Mon, Jun 15, 2026 at 02:03:47PM +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Extend the TI LP8864/LP8866 device-tree binding to support backlight
> class properties alongside the existing LED class child node.
> 
> This is a preparatory change for converting the LP8864 driver from a
> pure LED class driver to additionally register a backlight class device,

That's fine, but should have little to do with the binding. The h/w is 
not changing.

> motivated by a use case on a hot-pluggable segment of an I2C bus. The
> generic led-backlight driver (led_bl.c) is a platform driver and thus
> inherently non-hotpluggable, which makes it unsuitable for hardware
> topologies where the backlight controller resides on a hot-pluggable I2C
> bus segment. By making the LP8864 driver itself register a backlight
> class device, it becomes a native I2C driver that properly supports
> hot-plug/unplug events.
> 
> The binding is updated to:
> - Reference backlight common.yaml at the top level, making
>   default-brightness and max-brightness valid optional properties
> - Make the "led" child node optional rather than required, since the
>   backlight class device is now the primary interface
> - Use unevaluatedProperties instead of additionalProperties to properly
>   allow properties inherited from the referenced common schema
> 
> The LED child node is preserved for backward compatibility with existing
> device-trees. No in-tree device-trees reference this binding, so this
> change has no impact on existing mainline users.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  .../bindings/leds/backlight/ti,lp8864.yaml       | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> index d44232d462bde..11d7e3840c6fb 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/leds/backlight/ti,lp8864.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Texas Instruments - LP8864/LP8866 4/6-Channel LED Driver family
> +title: Texas Instruments - LP8864/LP8866 4/6-Channel LED Backlight Driver family
>  
>  maintainers:
>    - Andrew Davis <afd@ti.com>
> @@ -21,6 +21,9 @@ description: |
>      https://www.ti.com/product/LP8866-Q1
>      https://www.ti.com/product/LP8866S-Q1
>  
> +allOf:
> +  - $ref: common.yaml#
> +
>  properties:
>    compatible:
>      const: ti,lp8864
> @@ -36,9 +39,15 @@ properties:
>    vled-supply:
>      description: LED supply
>  
> +  default-brightness:
> +    maximum: 65535
> +
> +  max-brightness:
> +    maximum: 65535
> +
>    led:
>      type: object
> -    $ref: common.yaml#
> +    $ref: /schemas/leds/common.yaml#

This was already supporting backlight properties. Changing it to leds is 
an ABI break.

The binding was designed to have a child node. Make that work for 
whatever you want to do with the driver. I see no reason to support with 
*and* without a child node.

Rob

