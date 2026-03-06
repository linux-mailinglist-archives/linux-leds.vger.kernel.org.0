Return-Path: <linux-leds+bounces-7124-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHUfGRK6qmmiVwEAu9opvQ
	(envelope-from <linux-leds+bounces-7124-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 12:27:14 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDE21FA22
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 12:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D81E300C7F4
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 11:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B02B37474C;
	Fri,  6 Mar 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvjPyKJv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D002DBF75;
	Fri,  6 Mar 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772796425; cv=none; b=Q576Cg0tYE/4hik33Vl6R1pnlzwtYFwazGh2LL2hxAFKwsDnRq8UyWOJugmSlbfgAMN0t1zVa3PYnJqJEaexKucnKT9zv219b9+LkNita7mYpfyaJxvP2eYe9kpaVdqvucQT7QUh7T7kyfahTtcXFZMSXBxJngn+2pKDbSSBWbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772796425; c=relaxed/simple;
	bh=ff3NLf3SKfgVFGbBC2MEbEaAkSbGrJZ/NnUMo5MLXQ8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rVp5yt6ur/zizEFgZatLee7qdSeHfiW2ZVPRZnHrXQDlEMZ0TDqvhhaYR/J30ZiJO1ff/q1jfrRKT0bc8t+L+ncE4z8YjJegp3SnxQOg+gjDKUM9HqjLucyqyURr1339Viy63WmfYi5IDzGu2eFyni+Xbg5I/AoemMGcM+u0UPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvjPyKJv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C486DC4CEF7;
	Fri,  6 Mar 2026 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772796424;
	bh=ff3NLf3SKfgVFGbBC2MEbEaAkSbGrJZ/NnUMo5MLXQ8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HvjPyKJv5LbyqkQ2G+t7TCfyUDPKIdjMtftvaekCchPXiItF2sHX7vxdZ1Kr/tIfy
	 hdls1Kng16gN2tjMr7y9h37Y8r6W5NakoiFg8V68tjm2C+GkdQSwb3kNBYdOw7kfEC
	 PjC3xCPZYegwxD1CRQSMfbOy/2cBRhtABPOe8LqX+SETZoPyBSe3DJjyiAjyh3P6sm
	 8zQhKrt8hR0mgUW9Goe+8hHaOhEc9jaJKf6EMciIwxwx9tYT7YdPdq1lj62zl11sa2
	 +7eINMVTN51POnUGSkMDm7uTgZ+3Nl4GiRlngNUKMjY73cTs3K5TiYGNXJWch/xB9L
	 bmGCN1ZOxWvGQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216110441.160155-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110441.160155-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] leds: ktd2692: Make ktd2692_timing variable
 static
Message-Id: <177279642353.940370.3652835275775191287.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 11:27:03 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Queue-Id: B9FDE21FA22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7124-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 12:04:42 +0100, Krzysztof Kozlowski wrote:
> File-scope 'ktd2692_timing' is not used outside of this unit, so make it
> static to silence sparse warning:
> 
>   leds-ktd2692.c:62:33: warning: symbol 'ktd2692_timing' was not declared. Should it be static?
> 
> 

Applied, thanks!

[1/1] leds: ktd2692: Make ktd2692_timing variable static
      commit: c8193157eacb6c5e04f2f8aa45c17a05f1fc502f

--
Lee Jones [李琼斯]


