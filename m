Return-Path: <linux-leds+bounces-4533-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8FA98569
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 11:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 024021776B4
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 09:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B7B23027C;
	Wed, 23 Apr 2025 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnjZS3J9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21D242D61
	for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400356; cv=none; b=dTFhEqAR6MbkiQGe6b9Yi2U8pBQmmpTUU2lWbVguBfl9hlY6ov0B7tVxpKjiQUd05IyluM/O9FxclzOBrnThH/miX8aQBLEb5RRQ2QYyUZrX+hEvdnpsm98DpztpQL/SvTkCcPYqyg/jK3SeKUTT7PJnnmFqezCplY8abS9/MTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400356; c=relaxed/simple;
	bh=84UrNSlU0woIpzxgvDxH/HJuhc2RyZ/+6TFyFdS1R6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJfrLKGsTyryYsb9hhWfhmViuSMjyCj/7t1gaPQoXBTnt0VkfTb/qBMK5NdbNlYAyzrQDNDHIM/nFChYANz9t8u8FzsmXZfQfvnRmOP0XtgtIN25VA2nALSDUBnWHShu9dl3PV5ArNaVBs+Jg3bRPq6cr30uju04fXG+qqOuMu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnjZS3J9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A6AC4CEE2;
	Wed, 23 Apr 2025 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745400355;
	bh=84UrNSlU0woIpzxgvDxH/HJuhc2RyZ/+6TFyFdS1R6c=;
	h=Date:From:To:Cc:Subject:From;
	b=KnjZS3J9Y/I8DGunONIm3GcGJehKxrxLEjNj3zntnAyIJsFoyxnvX9juhE+4z+L73
	 M0kHLgZokwNwXKUPVbNo6Hqdr/3tp8UdOhj3nX+/OHCy3RTl7krP+hNxDiF5TMFeAZ
	 BapXKWgKNintF5gjvDzYhJcTVL1fJyDYJlM1goyaabjIdbnhEx1xtVfgeZ/hmK6QBf
	 FLd+FY4XciFnPCnh+s6qKRTeu68bOGCRtctQoI6e/4SzYHPseTPp7LJkewnjUfcpYL
	 EQ1/lhDfSmY96QLDiFtxTfL8n8eeUTkQh5G/gFc9udx37en4x5eAIex1E9uWUvr3pW
	 fbGlzL8ApZiIw==
Date: Wed, 23 Apr 2025 10:25:51 +0100
From: Lee Jones <lee@kernel.org>
To: pavel@kernel.org
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: LEDs Testing Framework
Message-ID: <20250423092551.GA8734@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Good morning Pavel, et al.,

Is anyone aware of any LED testing frameworks?

I would like to author one, but I'm hesitant to reinvent the wheel.

Kind regards,
Lee

-- 
Lee Jones [李琼斯]

