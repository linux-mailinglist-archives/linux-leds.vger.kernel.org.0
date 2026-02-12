Return-Path: <linux-leds+bounces-6936-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJcBDUKPjWl54QAAu9opvQ
	(envelope-from <linux-leds+bounces-6936-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 09:28:50 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8D12B51A
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 09:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04E433012D28
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8A32D63FC;
	Thu, 12 Feb 2026 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5fskWeF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764552C0F89;
	Thu, 12 Feb 2026 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884926; cv=none; b=S2323wGm/iAngQyOomYhAfNSBF0Sya2YNfRu8o7NGPqGq07rJTW9zk6BuMu4FnIpCadmW/7b+K3+jvMtjT5rN38kQlUrgqfJ6HtUClXffag+c4229N60vGLygbZYSObgS31jvXxRhrCtXeqQAzvwYIif52UVwDpOlOtTmGZPyVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884926; c=relaxed/simple;
	bh=FxicXlT1Tmd+JmHYPWKWPjLW6ELJnQtFmdxvC/JVO2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl4sQ7Jn0L9lsQCJJzCRTjx1453MuDIjhke5wjfmwknae1Fip8FfNK24xeRFdWh8IXllRzL7Hm/gf8ZFy9YtSoLRZTd/83HwFjlochyuwEqwVDeaYhw20fGYS1zC1SeR4xwyH0L2r3jm3+GYrzPSlLlN7ZY/LTRJeabMtP3q/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5fskWeF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2922DC19421;
	Thu, 12 Feb 2026 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770884926;
	bh=FxicXlT1Tmd+JmHYPWKWPjLW6ELJnQtFmdxvC/JVO2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5fskWeFN7va1zAJHikoeENS49bxi45uwH2sMd1hQDhZ4JvAcR+HmagLwCZe256yJ
	 LcPycq6lOT00k6UvyYhDvSd7+aJMszlcm6kZJXPOyo+UK8ZO2vcFbmrZlK7aP7+SVK
	 uk1aJ3I29wkI3lvgV5A4HewDzroBobHWK33P4VJZOhWwo9peIXZCFrICvSG1BWw3/l
	 9/CpRh3+6+7G6PSyl1lvstPSC2mSQC8uPbc4QSkPzvOmo1+FfQGPFE6zaCxBZoCga0
	 g4QdVZqI8ZW5EWWu79AONM6vEdpatKIhg/pzZJV9m1NjZQmqRJCuekdHREGjZSICDR
	 FkUpCk38hzuTQ==
Date: Thu, 12 Feb 2026 08:28:41 +0000
From: Lee Jones <lee@kernel.org>
To: "Escala, Edelweise" <Edelweise.Escala@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] Add Support for LTC3219 18 Channel LED Driver
Message-ID: <20260212082841.GB9065@google.com>
References: <20260126-ltc3220-driver-v5-0-152a30e98ab7@analog.com>
 <DS0PR03MB72285F5F9526B1020188CE3FED60A@DS0PR03MB7228.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR03MB72285F5F9526B1020188CE3FED60A@DS0PR03MB7228.namprd03.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6936-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0C8D12B51A
X-Rspamd-Action: no action

On Thu, 12 Feb 2026, Escala, Edelweise wrote:

> Hi all,
> 
> I’d like to kindly follow up on this patch series.
> Is there any additional feedback or action needed from my side to help move it forward upstream?
> 
> Thank you for your time and consideration.

Yes, probably.

However, the merge-window is currently open which mean maintainers and
reviewers are either concentrating on activities or taking a break.

We'll get around to reviewing your submission soon.

-- 
Lee Jones [李琼斯]

