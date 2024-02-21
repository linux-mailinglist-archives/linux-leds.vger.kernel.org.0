Return-Path: <linux-leds+bounces-888-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18485D297
	for <lists+linux-leds@lfdr.de>; Wed, 21 Feb 2024 09:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B596B1F23189
	for <lists+linux-leds@lfdr.de>; Wed, 21 Feb 2024 08:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73CC224ED;
	Wed, 21 Feb 2024 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vexlyvector.com header.i=@vexlyvector.com header.b="QqLiTN2X"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.vexlyvector.com (mail.vexlyvector.com [141.95.160.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5D26287
	for <linux-leds@vger.kernel.org>; Wed, 21 Feb 2024 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.160.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708504258; cv=none; b=eABuyhzT4/6zaawiLRksBRs9TcVrU6lFBZyTZhMFQ+Me73uoZyFoTO81MSB8ehUGlkH1kcBq+eWfANYdmax8v6c0vOd5WXVxiRL0ngxcqsl9wTMPILgBJS5OFV32Ca+pnsEWcZMbrn4rXAkFRt+bkuyhLWmbtP5sW3Uf8QW10Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708504258; c=relaxed/simple;
	bh=waaYxUsyRtmB2zEBuWcqRuRHSoYd8sJFCtgHO/3AHKE=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=qzF5+4GzZ8M1tmofSzf0Gof6+yuQPMPRmAxeA1O3ew8SObcr5Wouqjuosr8Stbnv+d0Hy40ovGSGMR3HzUQEp6/D3IdXO2kx50WnJyJWe0wXhLnc8WdspmAqDt6MyYjwsOGNn+bYX0S0fve6gUOLLoqbVYD+YydED+v/9+yO2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vexlyvector.com; spf=pass smtp.mailfrom=vexlyvector.com; dkim=pass (2048-bit key) header.d=vexlyvector.com header.i=@vexlyvector.com header.b=QqLiTN2X; arc=none smtp.client-ip=141.95.160.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vexlyvector.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vexlyvector.com
Received: by mail.vexlyvector.com (Postfix, from userid 1002)
	id AA347A2DE9; Wed, 21 Feb 2024 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexlyvector.com;
	s=mail; t=1708504251;
	bh=waaYxUsyRtmB2zEBuWcqRuRHSoYd8sJFCtgHO/3AHKE=;
	h=Date:From:To:Subject:From;
	b=QqLiTN2X6tgC7pmjU8b6/0tP01RezdpbF6q6XK2tip2T0vOkmc0ZAut/CF6O8FlXu
	 lWfE3fNgilVIuTDL7ZC6BkDBygxOgsZtB31QdwcyvWy0kED2wDB3yuzG1sAkIZZ+gP
	 sMbwxn6F6+NDGaSB9llj6xUyADSfiFSY04Qfn9X5pyyJNcCHrzof9aXBJZv7YLUWhK
	 sDCSkt6R6vh1iNx9YOGEZILYCF7sCfHCKBWjL5zjQRzWCGPlzep7qlNT4xVgZEe0yA
	 Tpljd4tPhsQWYxRGyQ1GHs18B2MJtiksNLlmsi98HzMFEMPRCYckwnAl3u9Z813ARo
	 XVMWwhfZkcQ1Q==
Received: by mail.vexlyvector.com for <linux-leds@vger.kernel.org>; Wed, 21 Feb 2024 08:30:35 GMT
Message-ID: <20240221074500-0.1.c5.qevp.0.mfnejtevd1@vexlyvector.com>
Date: Wed, 21 Feb 2024 08:30:35 GMT
From: "Ray Galt" <ray.galt@vexlyvector.com>
To: <linux-leds@vger.kernel.org>
Subject: Meeting with the Development Team
X-Mailer: mail.vexlyvector.com
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to reach out to the decision-maker in the IT environment wit=
hin your company.

We are a well-established digital agency in the European market. Our solu=
tions eliminate the need to build and maintain in-house IT and programmin=
g departments, hire interface designers, or employ user experience specia=
lists.

We take responsibility for IT functions while simultaneously reducing the=
 costs of maintenance. We provide support that ensures access to high-qua=
lity specialists and continuous maintenance of efficient hardware and sof=
tware infrastructure.

Companies that thrive are those that leverage market opportunities faster=
 than their competitors. Guided by this principle, we support gaining a c=
ompetitive advantage by providing comprehensive IT support.

May I present what we can do for you?


Best regards
Ray Galt

