Return-Path: <linux-leds+bounces-8550-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gjnYHuAiKWoyRQMAu9opvQ
	(envelope-from <linux-leds+bounces-8550-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 10:40:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C4667489
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 10:40:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="XB9O/RQa";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8550-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8550-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB2CA300A7F8
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 08:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D423AFB07;
	Wed, 10 Jun 2026 08:39:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C8C3A8721;
	Wed, 10 Jun 2026 08:39:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080796; cv=none; b=tf1T3K8GfMCZGqjoRGT2w09R95NEKkaOMutWopQQqmR8mSjaMnyw+MpK4XRr/SclZIDBmnIP4UmdqTef75mvvTYnutZoO1sm1PvdKZl9DYgwflr4NdvJBABg782uP3Cbbq+Ep/hilQUr0pCcGO+0FAqnhdC0gqTJoZU5qURNa5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080796; c=relaxed/simple;
	bh=A5cdkZ/gtimmWlV82ghBfERn3yMgg8OC8TgEUlbWuKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgOh3GHUMXYrHJq13dIEAKPGaa+HoTYyb+125wCbMBQYvPzyQHNLN6w0xlecp6iz8tx7hduN/fY76byksGk5zvqafIIG0J9bU3zoPGn7CsfQ3KV9glaoKd4/6IDGNBjSarNas0NPUcXD0UQVZ4c7JIJvY1SXuOZX10IvjUlfdk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XB9O/RQa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E381F00893;
	Wed, 10 Jun 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781080793;
	bh=s6uIQlsFzHBasbXfr+hoZ8Y6c8gene9N6tEqFVScL3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XB9O/RQawtDYKCzJDNn5GYTJhLuA+uhRJwMvQVCAxDVhUy7N0yvOS301PlljNcs3e
	 2LxfamAPedObg3T5w5nW03bQcAistzuSsVtHIvGE5HTtVHEqa6vftGEuTuPyIPudRY
	 bk/Ltl7+rUICOrdICzRR+1cFQyC8u1XTCZZ9QqdNTnCxBCvMhDTgVWJ1002Gba6jyD
	 s0WIR+prjxWl4rQEEDYXETo/+JIYeCKcDTz10As9PBF4WZiZ0gWAW99z0hWUd8qVI0
	 K8kqrYjH+dwNQcY6JPli7L+cSGY3+Cvp8ULfq+OlghCGT7NmM7DopjM3FhFvZXg3Ed
	 O8+Y1w91xnLFA==
Date: Wed, 10 Jun 2026 10:39:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jonas.gorski@gmail.com, noltari@gmail.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] dt-bindings: leds: bcm6358: Convert to DT schema
Message-ID: <20260610-gifted-zebra-of-reward-2ab6c7@quoll>
References: <20260609181731.1379846-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260609181731.1379846-1-ninadnaik07@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ninadnaik07@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonas.gorski@gmail.com,m:noltari@gmail.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:me@brighamcampbell.com,m:linux-kernel-mentees@lists.linux.dev,m:skhan@linuxfoundation.org,m:krzk@kernel.org,m:conor@kernel.org,m:jonasgorski@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8550-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,brighamcampbell.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 286C4667489

On Tue, Jun 09, 2026 at 11:47:01PM +0530, Ninad Naik wrote:
> +maintainers:
> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm6358-leds
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  brcm,clk-div:
> +    description: SCK signal divider.
> +    default: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8]
> +
> +  brcm,clk-dat-low:
> +    description: Makes clock and data signals active low.
> +    type: boolean
> +
> +patternProperties:
> +  "^led@(0|1?[0-9a-f])$":

"0" is already in "[0-9a-f]".

> +    type: object
> +    $ref: common.yaml#
> +    description: Each LED is represented as a sub-node of
> +      this device.
> +
> +    properties:
> +      reg:
> +        description: LED pin number (0 to 31).
> +        maxItems: 1
> +
> +      label: true
> +
> +      default-state: true
> +
> +      linux,default-trigger: true
> +
> +      active-low: true

Drop all four above and switch to unevaluatedProperties: false.
unevaluatedProperties should be also placed after $ref: common.yaml for
example.


> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false


Best regards,
Krzysztof


