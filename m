Return-Path: <linux-leds+bounces-7008-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G2gE3HQnGllKQQAu9opvQ
	(envelope-from <linux-leds+bounces-7008-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 23:10:57 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1EB17E06D
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 23:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EEF2314D9CD
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 22:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1606B37BE98;
	Mon, 23 Feb 2026 22:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ5gyb/s"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740B37AA76
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 22:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884180; cv=none; b=UAkU7cN0hO3Bc94pR0ts+oSj3Kpuq3Ldr60QpT07ytMVbArclozAZqdDnUonqbSD7OPJ6UrInHp+6P3wrwp23k9StKJXoq541mH6UPIpyUIDkRLSZdTp2piHmOj0EKmGliSKecCoRDtCwKED+FT5t8SDe0y28IG5aGDAR7NEp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884180; c=relaxed/simple;
	bh=vOliKEklsOkVi2OI7GEGcuD2cvljfQQ9hSmIICKD6dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ML8QAIi0xTPgGSTO7JM4P5c86Y0OblUhde0KXhpJysRED3x/7BaN3/Ci2fLLt8da9g3E5qFKJrxk4oIRWbjv+DI1Oc17PvIeYnYnaK2iSsfqWUfnQmmNIUSTQNaJ3zjowGXVTxTZcVNHGxeA1Sk/P9RIbljKnaYvYzK8Mmt9eMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ5gyb/s; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12776bebe9fso632800c88.1
        for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 14:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884177; x=1772488977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sY2gQZyu0SZT38nxbLjfE/c3YsVd2LXz174z3vm70B8=;
        b=TQ5gyb/sr8NBLGRzSAUJZMR87ixey/NAp8QQTwTfzPnunLa8XvyJBva+t9MRoMqe51
         3oDp828niL4Xl9f8afs8ekL2dSuM+/R17kqLxVunuIqX4PHmUmFX4dqd6GTcTHRyQZsx
         /538iKUn5VfKadX8K/3xxUIGn1L1WgzfbeBiynF92nWz8Of6wjHaIapaj48onv35ps7f
         lS4ljH/sxs77LWKG2gSd4r5J6gqlOTBrG6tFJD7lcgHn92CaR0QDloL5uhFFbS0CZFqe
         e1U6spOZ01mrYW/UjdfJEB2ZkFDpBhPoh5Ob0wI6h+KhCxr6O7vJPWe/ttEB3zneeOaV
         BWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884177; x=1772488977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sY2gQZyu0SZT38nxbLjfE/c3YsVd2LXz174z3vm70B8=;
        b=r8s71SLgVFVFRajhWqszE5L5eYHRYhoQyO+ip0A0K+tR5tRgIATGAg0O8gVO8oMJna
         5Kh2Q50HyOFivlHGZfcNz6iACpMhEZzzNqV54ESHNdFnSutX8pwCaa1L7K20xLEzrz4Q
         HNnbyTNNsNFIKFUeYSgi77qVpKfV5hDMrnUBOVBd+VvSvUEtZDXJdhNfYCWGfUrANTk6
         IA+ZXgfjXDAxNV3wHN97FgE7Bq2WXOFDChMHi968hxURRixu9bueJkr9PWLgkSLbf4uO
         LR621KUr68BWlEAan2FvX87gbdMRQhInoVv+u57zLUnEb6TKfGV/XFcNyKIASBJBHgeb
         kv4g==
X-Forwarded-Encrypted: i=1; AJvYcCVcZDk4sQN3rMmmD2CMXsjWCZ6sCPBt/gs1PEAYRBj2b0yATg+KEc5gez1oUGP3Mi02t1+Fx04AvezN@vger.kernel.org
X-Gm-Message-State: AOJu0YwnkNCVxYjW87LgJdGc1muzmeIwRBOqFO/QEI16SLmUmPk1kyQq
	k53YeSEh8Pc6ZMgH+vZQ3JzB2GPFi8t4PT7Xe0u+Uqq+klBdO9QrSNuD
X-Gm-Gg: AZuq6aKmTkfx7ieRyjOPzMpIrPwa0i6FlRxQ76xLJNBNzy++48hX44aTuF/O0sB+qJN
	5S/PU6FM3r8OPFExwqTvtOMwISaYtBEXypGMsHF4Cx+aY7F/MEXOiRqZtqzXAarN5kDguv7qcyn
	fk9htoLySv/e1VuFst1EnMyu5fzCTmwvMOOMRPGyOffAWQclLWTJc3CmGNeGuc+9TCOS0yvv2yp
	HdUVOVSV3Xheupz9hDvQiOhjQLBR1LjttV8hk3K/P4g/08NVZzdk2WPVDl1CHYefNlvIYqpEN9N
	tP9q9z8h+6Wb63WXiGZTHJ8K+KgZ+GOBrqBEUVGNMd2Xd7qYFuaprM2ZuaIKqYjvEcq8q3liROc
	zImoIcJsUcSD5T8K1qtJDq7ICRKLDmnHi6VXEUOJHx+KwtSC8lIbS6FpVYrFXbs8PPAJCl+kXXl
	dziwXD2zWQ+0V9RIxNKMHuzAPXZp/JkJUS8JvpSkU69SFg2a04oMXKuTvHkQyRRSI5
X-Received: by 2002:a05:7022:1602:b0:123:2c98:f65d with SMTP id a92af1059eb24-1276acbc65cmr4160327c88.13.1771884177083;
        Mon, 23 Feb 2026 14:02:57 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af20fc8sm9623904c88.6.2026.02.23.14.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:02:56 -0800 (PST)
Date: Mon, 23 Feb 2026 14:02:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, linux-input@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 5/9] dt-bindings: input: cpcap-pwrbutton: convert to
 DT schema
Message-ID: <aZzObk7Ripr0Uh6Z@google.com>
References: <20260223063858.12208-1-clamor95@gmail.com>
 <20260223063858.12208-6-clamor95@gmail.com>
 <177186521369.3975744.16898258990517269078.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177186521369.3975744.16898258990517269078.robh@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7008-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,baylibre.com,atomide.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F1EB17E06D
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:46:54AM -0600, Rob Herring (Arm) wrote:
> 
> On Mon, 23 Feb 2026 08:38:54 +0200, Svyatoslav Ryhel wrote:
> > Convert power button devicetree bindings for the Motorola CPCAP MFD from
> > TXT to YAML format. This patch does not change any functionality; the
> > bindings remain the same.
> > 
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
> >  .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
> >  2 files changed, 32 insertions(+), 20 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
> > 
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please merge with the rest of the series.

Thanks.

-- 
Dmitry

