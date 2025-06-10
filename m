Return-Path: <linux-leds+bounces-4780-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E29AD414C
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 19:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0240D7AD90A
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 17:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D61247287;
	Tue, 10 Jun 2025 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoWifYh/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CB8245027;
	Tue, 10 Jun 2025 17:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578118; cv=none; b=nkdfuYUrrerNubv9JrLWViL0jcGv+Kmk5Id4/MfZJHGQinNNZwZJKvm/eq7mL0lh8JCBviA5pUnMBwYR2wFBnm5LIA1G5CYzAjnfr0XxOOdCkiJqSfG7N3U+lXVb1c9vCM5F2gHGoY0EFzFc3UDqjAQT9DtsAHHBL2uZh8KD5Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578118; c=relaxed/simple;
	bh=qDMlj5Xw4H0umu922A8fBL2sbekOqw18yJyz9IeZPP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=usAgzfK/8jlRwvjUe7CR62OMslJhmHS5AC/jtcUveRuta0SL0dUeM3g+cb2GmlDt81FWkIaBxUBn6IKHZmZTHfcnxXlUG/MF+G0QmUL2IaQQCvxZwyaOsIidANH9SgIrIzQs3+FetH9jEOiEllASOUxmuHo0fdJWg7HN18jSRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoWifYh/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74264d1832eso6652290b3a.0;
        Tue, 10 Jun 2025 10:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749578116; x=1750182916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDMlj5Xw4H0umu922A8fBL2sbekOqw18yJyz9IeZPP4=;
        b=ZoWifYh/S7gTYpJB1awh80lAKTV6mWRjbrY/TZTAtbnju+Oib7U+CeLuz5xAhZp0ep
         h4xa0UXJLUlgN/0VARp05RqRNe7EBNw0EY76Zczk1TnIW63OZO/lrXyJ/L6JLNCHxcQW
         JQLnjSKXBkTF9EabTT67XCfr8uu8YRiiYJOI7pm+HzoaSMDRq93NvDHTw6YF2gXbFI6S
         apFO6BqTz1KDnOuEOLfvzrrTWDtZ/SUT4N8a4QyeinV1PiLhV8uDnUU0f2PJAMkqpVLi
         82uKGopJwJkL5i0eyQn7dgmfWwhWprAUzD+VesGE6hUUZA7y4ftM1pvA2ZE9KywMylL0
         0NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749578116; x=1750182916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDMlj5Xw4H0umu922A8fBL2sbekOqw18yJyz9IeZPP4=;
        b=Sbokp7rKm68gMaG/iaW7859ahChR07DX94bGax45SeOomJnnGgVyWtpmZiZ2N++yid
         /HpSjuD0NSsr5HGhqfsfZiBKuWU0KhPqRoW0kx8j5J7cFs/nsryzdNYNCRIf0QIUIJrf
         PP1AwdpQLzVBB85xMHgjKr9DYZwsSlGoOYDSOXQcWH+lj8iX2hZ+FWXnBVqEYtNB1VWa
         ZZ4pqqCRBK+UhOQcDhGQW0pPlXREhY1ZBzGiEPaY44NiJdOwmjFxqjaXwL5rH9YB0HmY
         bYjWOWQUp04wHQDOoxpRAJLSuzWO+RiKLUHhE7Mnml7Twn0u0y69MHD9iTrl1HlPgMJG
         xPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlujOJOD301CSb9H5YdGDwwN4/uyclWu4z67aaCyX1VfqXq+jAbiCMX/Lm4QnbgzkxdmOfjquQG20QWw==@vger.kernel.org, AJvYcCVje0J2pF7xxJi7sOsPTtOWqr6JudbC2fcLtIVRxsSjLCQVC8qJA0509WFQWD0jDEX3D+C913k77Xbsw022@vger.kernel.org, AJvYcCWp9eGtEAYHjanCJtw8mXvkL7BfYdfHDXNJdyEAXPSDQX0sXK7BfW/c4Bjh3uy9nHaS3JCUkBgroz+w@vger.kernel.org, AJvYcCXa90V7zcjQjnJVUmriIBiqHTlBaP+teuJS0mtzVTj5RmPFOBvCf5vHHhXz/TRZ5NDsP8fknBQwE6fI@vger.kernel.org
X-Gm-Message-State: AOJu0YwxC6/QJU3u587c7PM7Z8UCcPq1FQHheoV3+rWCae/EE8eX0DbO
	VwyFU5PlOAQK/ZzXmSMJCdt3V86UyiAyPB1utskeHR3ySpcv4u9ZDTRFMmGAcg==
X-Gm-Gg: ASbGncuIL3IiWop+kuHqWBIs2zcbHKywNF/8oLrLUQTn/DnBFHOEvPP8Nk1FpDlgEWM
	u7ArLvl35Po/cl8gjSZgq/7EIAHHFyoEQV9kZGdxZ/Ehq6tsmQELYeEEg0xVRQpG1F/yKVbOD4S
	xSQyOuXwXHhw6mPNtAMRUn0Pt10FQkC9vgO2nQeAp2l1uyIClvjVXRkQW0KfK+3eMVDvW3rbm6+
	EsupXbK8FhyLgPgHxHmiJt91HaWlgM7pozSBTkFZhwRaCaduWVcd+7NoXkwLx0oex851CRg/CAz
	J6mMScQu9BogtmkDbemv3IBuIOHIuWLRlnH/VP9ZFsFGnH4ElyzNtxkc8UL6jn7MznxbYGAM
X-Google-Smtp-Source: AGHT+IH4M22F32APFBMSyxLZm9HztQBxbVHDL1fBimHA12si69nFzdQCqAyTKoXcuIQbMRRAbOwE1Q==
X-Received: by 2002:a05:6a00:2e07:b0:746:3200:5f8 with SMTP id d2e1a72fcca58-7486ce55a9amr541548b3a.22.1749578115873;
        Tue, 10 Jun 2025 10:55:15 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3aba1sm7725343b3a.33.2025.06.10.10.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:55:15 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 0/4] leds: add new LED driver for TI LP5812
Date: Wed, 11 Jun 2025 00:55:11 +0700
Message-Id: <20250610175511.186473-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610174319.183375-1-trannamatk@gmail.com>
References: <20250610174319.183375-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please disregard the mistakenly sent patch named "[PATCH v5] test"
— it was sent in error and is not part of this series.

Apologies for the noise.

--
Nam Tran

