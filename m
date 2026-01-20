Return-Path: <linux-leds+bounces-6691-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKMAOEC5b2kOMQAAu9opvQ
	(envelope-from <linux-leds+bounces-6691-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 18:20:00 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F84871E
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 18:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E5A08242DA
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 16:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B154657C0;
	Tue, 20 Jan 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/u7R5+h"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38774611C6;
	Tue, 20 Jan 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925503; cv=none; b=rqTvebrT3asfK+lAf3+Eb6IYHKOV5LbB/rgM3de37gcmF26Rq+ZXY0GQxlFM8W8ha6krx11yINbOF1NfSdXWaF60hXt3MjExxi90Xo2cfIwdxk9UkO1UXO1iXC2HLRQECAxNyI45Ux7JcJBl8C31ps+yMAORr6EL6+XQyVtbSQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925503; c=relaxed/simple;
	bh=dtUUx6lrNtFdy5/+TdTkG7ihJmXBG5s769rXUFmDzMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ity3BPwRNulrLXtYeH1VAR33KLekeQSjNOZw/94qBlmpyx9M7GAu0Edz3TWpocfeQxSroNgc6xc/JjTFW9AFoIWPstVeiF2byQTp++vOpiPVze2VR8t3zG/XmJ1RNvo1kqB52JYzEbHOLWYRw8r88f1WlDstX4w4Iqb+BqvrkvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/u7R5+h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917DFC19422;
	Tue, 20 Jan 2026 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925503;
	bh=dtUUx6lrNtFdy5/+TdTkG7ihJmXBG5s769rXUFmDzMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q/u7R5+hPtnkQdHXwUr7rplCFmrjMp4ucJKF8+aAi3t7ObI8CWsk0ZSfwI2io9TZ7
	 G6EbSPqS4sXfMKzDNh5GSXbSGpIISgDcUrJMWmzja95XaHObaUlILHsr5XgCSsWKhb
	 7qMkL67ioXva9EhwO+PnYksEku/pLjVj6CZksFLRUP6imyuZdoOPyeEYoHWjwIlGFs
	 6EKRGNbnVm8vBdW8bhIjp1UxjN8BPlOcjvYuxAQVZkxWQutGufu2KT0fxNRtiJ+IV6
	 9UO1GfSxJPVLxKQPtc7UVb6Yd36nARBmjMoT6v5md7iNsxE6VUbOI+AGqpaPQJEkQU
	 eFZHFcX9c7H0w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org, 
 christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
In-Reply-To: <20260115161013.40706-1-trannamatk@gmail.com>
References: <20260115161013.40706-1-trannamatk@gmail.com>
Subject: Re: [PATCH v22 0/2] leds: add new LED driver for TI LP5812
Message-Id: <176892550028.2317951.10477367628623153628.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 16:11:40 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6691-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,infradead.org,wanadoo.fr,lwn.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: BF1F84871E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 15 Jan 2026 23:10:11 +0700, Nam Tran wrote:
> This patch series adds initial support for the TI LP5812,
> a 4x3 matrix RGB LED driver with autonomous engine control.
> This version provides a minimal, clean implementation focused
> on core functionality only. The goal is to upstream a solid
> foundation, with the expectation that additional features can
> be added incrementally in future patches.
> 
> [...]

Applied, thanks!

[1/2] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
      commit: 4301afd6b3cbd428082b55ec7a6a840b3c8ec749
[2/2] docs: leds: Document TI LP5812 LED driver
      commit: 974d724e58fd2eee0fe46299901deae6fa9ebad1

--
Lee Jones [李琼斯]


