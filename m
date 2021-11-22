Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5989E459711
	for <lists+linux-leds@lfdr.de>; Mon, 22 Nov 2021 23:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239546AbhKVWHV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Nov 2021 17:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239539AbhKVWHU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Nov 2021 17:07:20 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48F5C061574
        for <linux-leds@vger.kernel.org>; Mon, 22 Nov 2021 14:04:13 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id x131so17353244pfc.12
        for <linux-leds@vger.kernel.org>; Mon, 22 Nov 2021 14:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=x/zJNpjOOe834hSUc+rgPFWcjGqrIKmegEUhrQMD4jo=;
        b=hG7IbUFlmTvUd9of5KWhxgJtUvA5QST1noI5BAxSLWm2oe7pfU8Kl+zBqpsATvUZP+
         ljEO1MjuddLXO0VZXTA7hnlqN7MBFxkqpDBT5QSwuUu5MLY2yP2uiqs4vd8b0qZUKRMk
         36xN4dKI195FTAK5TNBzSZNporoXwsPxMiJio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=x/zJNpjOOe834hSUc+rgPFWcjGqrIKmegEUhrQMD4jo=;
        b=yeY68qvJokK0p3hJ/zS2Db/9poltJM9a65Xc5tGKBhmWAL6RrnrwKwrXMVtNBsiYsH
         3jrj1SJmt6piUzg5RIFf2t0YQ6ObfMR6MLNdf24JXoli7kYfwA9WGD2sxyusJsdsiKzk
         DBTdOJy3jFBzuEswFvWAsTrN6Onp62UUMuB2G46E/Zptkg9JKo8kvu95rFOBzFGbVBLp
         PDXdqt9p0IQOeplRL63KDeGy+HXXYTDG89w9IP5iQsCPm7XHwQ2bL765Q6Q752TILqj/
         vNkxOiodjWFnVKzIaOJ5Hh0yCdXcBIigaT6GYzxkxNlXXvldc0vHW9/xaUPG1n4i57J9
         ms6Q==
X-Gm-Message-State: AOAM533W8PqIEWYHpDVC9sCZSGFGnt5+MKxunHsew1dM/SfC7E6mzhUT
        QUJ82Y3bEFl01sDs+h4SSyUJYw==
X-Google-Smtp-Source: ABdhPJwA4I5uVZ7PdhNN7MaXf21QMPCY0DZif2Su/O3UNO1jI5Fd8YR1gvKh72S2Dbp0kVbS8AoXKg==
X-Received: by 2002:a63:8449:: with SMTP id k70mr172964pgd.27.1637618653131;
        Mon, 22 Nov 2021 14:04:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2sm9866297pfu.203.2021.11.22.14.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 14:04:12 -0800 (PST)
Subject: Re: [PATCH 2/2] leds: bcm63xxx: add support for BCM63xxx controller
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211115091107.11737-1-zajec5@gmail.com>
 <20211115091107.11737-2-zajec5@gmail.com>
From:   Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <02a2dbb7-6ae0-af28-e852-ee66bb3d66f1@broadcom.com>
Date:   Mon, 22 Nov 2021 14:04:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211115091107.11737-2-zajec5@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000001e895205d167ce7d"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

--0000000000001e895205d167ce7d
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/15/21 1:11 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a new controller used on BCM4908, some BCM68xx and some BCM63xxx
> SoCs.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Same comment as the binding, please s/bcm63xxx/bcm63xx/ for matchign
existing drivers/patterns.

[snip]

> +
> +#define BCM63XXX_MAX_LEDS			32> +
> +#define BCM63XXX_GLB_CTRL			0x00
> +#define BCM63XXX_MASK				0x04

This define appears unused.

> +#define BCM63XXX_HW_LED_EN			0x08
> +#define BCM63XXX_SERIAL_LED_SHIFT_SEL		0x0c
> +#define BCM63XXX_FLASH_RATE_CTRL1		0x10
> +#define BCM63XXX_FLASH_RATE_CTRL2		0x14
> +#define BCM63XXX_FLASH_RATE_CTRL3		0x18
> +#define BCM63XXX_FLASH_RATE_CTRL4		0x1c
> +#define BCM63XXX_BRIGHT_CTRL1			0x20
> +#define BCM63XXX_BRIGHT_CTRL2			0x24
> +#define BCM63XXX_BRIGHT_CTRL3			0x28
> +#define BCM63XXX_BRIGHT_CTRL4			0x2c
> +#define BCM63XXX_POWER_LED_CFG			0x30
> +#define BCM63XXX_HW_POLARITY			0xb4
> +#define BCM63XXX_SW_DATA			0xb8

This is called SW_LED_IP in the register but I guess this name is a bit
clearer.

> +#define BCM63XXX_SW_POLARITY			0xbc
> +#define BCM63XXX_PARALLEL_LED_POLARITY		0xc0
> +#define BCM63XXX_SERIAL_LED_POLARITY		0xc4
> +#define BCM63XXX_HW_LED_STATUS			0xc8
> +#define BCM63XXX_FLASH_CTRL_STATUS		0xcc
> +#define BCM63XXX_FLASH_BRT_CTRL			0xd0
> +#define BCM63XXX_FLASH_P_LED_OUT_STATUS		0xd4
> +#define BCM63XXX_FLASH_S_LED_OUT_STATUS		0xd8
> +
> +struct bcm63xxx_leds {
> +	struct device *dev;
> +	void __iomem *base;
> +	spinlock_t lock;
> +};
> +
> +struct bcm63xxx_led {
> +	struct bcm63xxx_leds *leds;
> +	struct led_classdev cdev;
> +	u32 pin;
> +	bool active_low;
> +};
> +
> +/*
> + * I/O access
> + */
> +
> +static void bcm63xxx_leds_write(struct bcm63xxx_leds *leds, unsigned int reg,
> +				u32 data)
> +{
> +	writel(data, leds->base + reg);
> +}
> +
> +static unsigned long bcm63xxx_leds_read(struct bcm63xxx_leds *leds,
> +					unsigned int reg)
> +{
> +	return readl(leds->base + reg);
> +}
> +
> +static void bcm63xxx_leds_update_bits(struct bcm63xxx_leds *leds,
> +				      unsigned int reg, u32 mask, u32 val)
> +{
> +	WARN_ON(val & ~mask);
> +
> +	bcm63xxx_leds_write(leds, reg, (bcm63xxx_leds_read(leds, reg) & ~mask) | (val & mask));
> +}
> +
> +/*
> + * Helpers
> + */
> +
> +static void bcm63xxx_leds_set_flash_rate(struct bcm63xxx_leds *leds,
> +					 struct bcm63xxx_led *led,
> +					 u8 value)
> +{
> +	int reg_offset = (led->pin >> 3) * 4;

Maybe add some definitions here, like LEDS_PER_WORD and LED_SHIFT and
LED_MASK?

[snip]

> +static int bcm63xxx_leds_create_led(struct bcm63xxx_leds *leds, struct device_node *np)
> +{

You are not checking the return value of this function, make it void?

[snip]

> +static int bcm63xxx_leds_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = dev_of_node(&pdev->dev);
> +	struct device *dev = &pdev->dev;
> +	struct bcm63xxx_leds *leds;
> +	struct device_node *child;
> +
> +	leds = devm_kzalloc(dev, sizeof(*leds), GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	leds->dev = dev;
> +
> +	leds->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(leds->base))
> +		return PTR_ERR(leds->base);
> +
> +	spin_lock_init(&leds->lock);
> +
> +	bcm63xxx_leds_write(leds, BCM63XXX_GLB_CTRL, 0xa);

We would need a define for that:

0x2 -> SERIAL_LED_DATA_PPOL
0x8 -> SERIAL_LED_EN_POL

> +	bcm63xxx_leds_write(leds, BCM63XXX_BRIGHT_CTRL1, 0x88888888);

Cannot we let the LED subsystem change the default brightness?
-- 
Florian

--0000000000001e895205d167ce7d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDHG7gDNoanCGtqaNhjANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMTAyMjIwNjU3MTBaFw0yMjA5MDUwNzA3MjNaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEZsb3JpYW4gRmFpbmVsbGkxLDAqBgkqhkiG
9w0BCQEWHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEAu10WSl35INx8Ma97NH54zM3XKzx8Lo/KErWP5HPBtIxzYjBL20TDg9Jmnnbs
rZjwEVNKY30HiBRJcooDpalBATQpdw3kdYEgojrrXjVz4a+YaWhLbV0OwQ54QAkwKsdYTnuUX0B4
YLYGuUBDXYkcFWZv5BiAF4L97ClbTnUUCry8bhV9SP8b/tbivOhWUSjHLsQ9gEjuLhVId3Xgs9dA
TtoyOTJVs6HDth0+/13gxSrB3BwSY4wtw7EPHshswD1fzSV1fZf7QUQedadjH8BMBaKKseIieb6M
bhjsippX2btWEJOuUFS5RkK5HFFkzcGtIQd+gltZHQHohAcopF+cSwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUIDZLMN77
IWw6rnhSvGm2V4nv3AowDQYJKoZIhvcNAQELBQADggEBADVdzyh3BQZiABHSdL7LQPNr6/6OQwg7
65j9Ggyr2Rdl2RnQIifKtGGodVlJ8e9XCYt5rCNU8PriYstIk4jlMJp6SziSN0CLE+A+FujmTqZJ
X8vEct7sdLXqdlBvR23TLvnkxbS3RwED7FDDTxpIv5j87o78e+wrZOPvDskdrYXVWGUu23xmd2IS
kYMLAXNeGrVe6HovEKCJPw07+B35iJvwdpZBXiti5hFa3q1L0+K5nGMpceIrj4dOOkSNB2ipHR6H
Q5HbB0UbWMkRv1PYpxf5eMjyDqxNigsE2JIFa1nk8ckA8hoTKbypCoALjcSuNqdZZyOnMBSKguHJ
Zz4bBBwxggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxx
u4AzaGpwhramjYYwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIEQWPRGXYAgpKw07
Jnr0jUnovH7wOoIi4DO5RV9+oy7tMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIxMTEyMjIyMDQxM1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAqyBXHaAPqer15uTBzkT4V13lhxUH6nkao
dqPDa3z8ShMq3+l45hTUOxxUK41pn9ooTvKDN2Q+W561zGgJO1qUVQ+XfyP/2eiBEJYTJFcScIhw
GveM01lHhBWXYynzEyhtpSdmmdX1IGUQxT04/YjOcugrhvU2SKgt4Ugna+BNTIf+x3At6Cad9+l/
gV8N6YszEikigNp+KYw0X3e62vCKEcHgD0pw6MUX0yxVBpK5C/uecof4k5mi5cCKrbiuggJ83Z2W
3uWCTG57erF3NDJJUzMsGoRt3hhPIqWnT0zPbMVZ/TzOcosymgJf/AOqQxiUyx3Ca6EldQ9anRRl
nj1s
--0000000000001e895205d167ce7d--
