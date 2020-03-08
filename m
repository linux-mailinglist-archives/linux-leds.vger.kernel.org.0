Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C26FE17D39A
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 12:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgCHLdT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 07:33:19 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:58892 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbgCHLdT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Mar 2020 07:33:19 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 15114C3FF6; Sun,  8 Mar 2020 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583667196; bh=goway0Q14dDkQIPcxODmG5EN0REbxZfcvRQb+Nrn6DE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=S6p4GhGt7/R1OkAxC5y50+FVVeCZSLn7TLCgB5HRItwztvGTpCfI4Y25xUHOwHRqr
         fUMM6cJLMOsup39MwRqFrolfYIG/QJOlLEmz6guxTrF6Y2XZI4ASFmVyQtWCbBK7eI
         GHFJ7ZRotiExv3fHB8/vAaT92XFTPE8DWeAsk8Yg=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 252C3C3FEA;
        Sun,  8 Mar 2020 11:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583667192; bh=goway0Q14dDkQIPcxODmG5EN0REbxZfcvRQb+Nrn6DE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=mLHymhrbFWQthWcBCKZB44iViBJW2wRHN1OV5aPZLjLhkNVAIrmuugk8cH48XFdQV
         mHOZiRu1NNl9hELhX9tXH3xixj6I0HS4K12ug9C7/lHJ8VgVk0Q/3/uepp8yfyZvH3
         yvchCj3kjPMTgklLRrHo0RYlTYh/nqRpU+AsuIFc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
Date:   Sun, 08 Mar 2020 12:32:41 +0100
Message-ID: <4539487.31r3eYUQgx@g550jk>
In-Reply-To: <8d174b46-f7d0-119b-d8b0-ad89ecb1872f@gmail.com>
References: <20200227185015.212479-1-luca@z3ntu.xyz> <8d174b46-f7d0-119b-d8b0-ad89ecb1872f@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

Thanks for your review! Replies are inline below.

I'm wondering if I should implement support for the flash-max-timeout-us dt=
=20
property ("Maximum timeout in microseconds after which the flash LED is tur=
ned=20
off.") to configure the timeout to turn the flash off as I've currently har=
dcoded=20
250ms but this might not be ideal for all uses of the sgm3140. The datashee=
t=20
states:

> Flash mode is usually used with a pulse of about 200 to 300 milliseconds =
to=20
> generate a high intensity Flash.

so it might be useful to have this configurable in the devicetree. The valu=
e of=20
250ms works fine for my use case.

Theoretically also the .timeout_set op could be implemented but I'm not sur=
e=20
if this fits nicely into the existing "timeout" API and if it even makes se=
nse=20
to implement that.

Regards,
Luca

On Donnerstag, 5. M=E4rz 2020 22:09:16 CET Jacek Anaszewski wrote:
> Hi Luca,
>=20
> Thank you for the patch.
>=20
> On 2/27/20 7:50 PM, Luca Weiss wrote:
> > Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> >=20
> > This device is controller by two GPIO lines, one for enabling the LED
> > and the second one for switching between torch and flash mode.
> >=20
> > The device will automatically switch to torch mode after being in flash
> > mode for about 250-300ms, so after that time the driver will turn the
> > LED off again automatically.
> >=20
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > Hi, this driver is controllable via sysfs and v4l2 APIs (as documented
> > in Documentation/leds/leds-class-flash.rst).
> >=20
> > The following is possible:
> >=20
> > # Torch on
> > echo 1 > /sys/class/leds/white\:flash/brightness
> > # Torch off
> > echo 0 > /sys/class/leds/white\:flash/brightness
> > # Activate flash
> > echo 1 > /sys/class/leds/white\:flash/flash_strobe
> >=20
> > # Torch on
> > v4l2-ctl -d /dev/video1 -c led_mode=3D2
> > # Torch off
> > v4l2-ctl -d /dev/video1 -c led_mode=3D0
> > # Activate flash
> > v4l2-ctl -d /dev/video1 -c strobe=3D1
>=20
> What is /dev/video1 ? Did you register vl42 flash subdev
> in some v4l2 media controller device?

On the Allwinner A64 SoC /dev/video0 is the node for cedrus (video encoder/
decoder), so the sun6i-csi driver gets to be /dev/video1

# v4l2-ctl --list-devices
cedrus (platform:cedrus):
        /dev/video0
        /dev/media0

sun6i-csi (platform:csi):
        /dev/video1

Allwinner Video Capture Device (platform:sun6i-csi):
        /dev/media1


Here's the relevant part from my dts:

sgm3140 {
    compatible =3D "sgmicro,sgm3140";
    flash-gpios =3D <&pio 3 24 GPIO_ACTIVE_HIGH>; /* FLASH_TRIGOUT: PD24 */
    enable-gpios =3D <&pio 2 3 GPIO_ACTIVE_HIGH>; /* FLASH_EN: PC3 */

    sgm3140_flash: led {
        function =3D LED_FUNCTION_FLASH;
        color =3D <LED_COLOR_ID_WHITE>;
    };
};

/* as subnode of csi (compatible: allwinner,sun50i-a64-csi) */
ov5640: rear-camera@4c {
    compatible =3D "ovti,ov5640";
    <snip>
    flash-leds =3D <&sgm3140_flash>;
};

>=20
> > Unfortunately the last command (enabling the 'flash' via v4l2 results in
> >=20
> > the following being printed and nothing happening:
> >   VIDIOC_S_EXT_CTRLS: failed: Resource busy
> >   strobe: Resource busy
> >=20
> > Unfortunately I couldn't figure out the reason so I'm hoping to get some
> > guidance for this. iirc it worked at some point but then stopped.
>=20
> You have to be in flash mode to strobe i.e. led_mode=3D1.

Of course..! Makes sense, I just never realized the v4l2 device had to be i=
n=20
this mode for the strobe button to work. It works nicely with that, thanks!

> <<snip>>

> > +static void sgm3140_powerdown_timer(struct timer_list *t)
> > +{
> > +	struct sgm3140 *priv =3D from_timer(priv, t, powerdown_timer);
> > +
> > +	gpiod_set_value_cansleep(priv->enable_gpio, 0);
> > +	gpiod_set_value_cansleep(priv->flash_gpio, 0);
>=20
> You could also implement strobe_get op and return from it a flag
> indicating if LED is strobing.

Makes sense.
> > +}
> > +
> > +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> > +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
> > +					   struct=20
v4l2_flash_config *v4l2_sd_cfg)
> > +{
> > +	struct led_classdev *led_cdev =3D &priv->fled_cdev.led_cdev;
> > +	struct led_flash_setting *s;
> > +
> > +	strlcpy(v4l2_sd_cfg->dev_name, led_cdev->dev->kobj.name,
> > +		sizeof(v4l2_sd_cfg->dev_name));
> > +
> > +	s =3D &v4l2_sd_cfg->intensity;
> > +	s->min =3D 0;
> > +	s->max =3D 1;
> > +	s->step =3D 1;
> > +	s->val =3D 1;
> > +}
> > +
> > +#else
> > +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
> > +					   struct=20
v4l2_flash_config *v4l2_sd_cfg)
> > +{
> > +}
> > +#endif
> > +
> > +static int sgm3140_probe(struct platform_device *pdev)
> > +{
> > +	struct sgm3140 *priv;
> > +	struct led_classdev *led_cdev;
> > +	struct led_classdev_flash *fled_cdev;
> > +	struct led_init_data init_data =3D {};
> > +	struct device_node *child_node;
> > +	struct v4l2_flash_config v4l2_sd_cfg;
>=20
> s/v4l2_sd_cfg;/v4l2_sd_cfg =3D {};/
>=20
> Otherwise it is possible that some controls would be initialized
> to random values.
>=20

Ack

> > +	int ret;
> > +
> > +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->flash_gpio =3D devm_gpiod_get(&pdev->dev, "flash",=20
GPIOD_OUT_LOW);
> > +	ret =3D PTR_ERR_OR_ZERO(priv->flash_gpio);
> > +	if (ret) {
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			dev_err(&pdev->dev, "Failed to request flash=20
gpio: %d\n",
> > +				ret);
> > +		return ret;
> > +	}
> > +
> > +	priv->enable_gpio =3D devm_gpiod_get(&pdev->dev, "enable",=20
GPIOD_OUT_LOW);
> > +	ret =3D PTR_ERR_OR_ZERO(priv->enable_gpio);
> > +	if (ret) {
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			dev_err(&pdev->dev, "Failed to request=20
enable gpio: %d\n",
> > +				ret);
> > +		return ret;
> > +	}
> > +
> > +	child_node =3D of_get_next_available_child(pdev->dev.of_node, NULL);
> > +	if (!child_node) {
> > +		dev_err(&pdev->dev, "No DT child node found for=20
connected LED.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	timer_setup(&priv->powerdown_timer, sgm3140_powerdown_timer, 0);
> > +
> > +	fled_cdev =3D &priv->fled_cdev;
> > +	led_cdev =3D &fled_cdev->led_cdev;
> > +
> > +	fled_cdev->ops =3D &sgm3140_flash_ops;
> > +
> > +	led_cdev->brightness_set_blocking =3D sgm3140_brightness_set;
> > +	led_cdev->max_brightness =3D LED_ON;
> > +	led_cdev->flags |=3D LED_DEV_CAP_FLASH;
> > +
> > +	init_data.fwnode =3D of_fwnode_handle(child_node);
> > +	init_data.devicename =3D SGM3140_NAME;
>=20
> devicename should be skipped in new drivers.
>=20

Ack

> > +
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	/* Register in the LED subsystem */
> > +	ret =3D led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
> > &init_data);
>=20
> We already have devm_* prefixed version thereof.
>=20

Ack, switched to the devm_ variant

> > +	if (ret < 0) {
> > +		dev_err(&pdev->dev, "Failed to register flash device:=20
%d\n",
> > +			ret);
> > +		goto err_flash_register;
> > +	}
> > +
> > +	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
> > +
> > +	/* Create V4L2 Flash subdev */
> > +	priv->v4l2_flash =3D v4l2_flash_init(&pdev->dev,
> > of_fwnode_handle(child_node), +				=09
   fled_cdev, NULL,
> > +					   &v4l2_sd_cfg);
> > +	if (IS_ERR(priv->v4l2_flash)) {
> > +		ret =3D PTR_ERR(priv->v4l2_flash);
> > +		goto err_v4l2_flash_init;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_v4l2_flash_init:
> > +	led_classdev_flash_unregister(fled_cdev);
> > +err_flash_register:
> > +	of_node_put(child_node);
>=20
> You need to relase of_node also in case of success.
>=20

Done.

> > +	return ret;
> > +}
> > +
> > +static int sgm3140_remove(struct platform_device *pdev)
> > +{
> > +	struct sgm3140 *priv =3D platform_get_drvdata(pdev);
> > +
> > +	del_timer_sync(&priv->powerdown_timer);
> > +
> > +	v4l2_flash_release(priv->v4l2_flash);
> > +	led_classdev_flash_unregister(&priv->fled_cdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id sgm3140_dt_match[] =3D {
> > +	{ .compatible =3D "sgmicro,sgm3140" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, sgm3140_dt_match);
> > +
> > +static struct platform_driver sgm3140_driver =3D {
> > +	.probe	=3D sgm3140_probe,
> > +	.remove	=3D sgm3140_remove,
> > +	.driver	=3D {
> > +		.name	=3D "sgm3140",
> > +		.of_match_table =3D sgm3140_dt_match,
> > +	},
> > +};
> > +
> > +module_platform_driver(sgm3140_driver);
> > +
> > +MODULE_AUTHOR("Luca Weiss <luca@z3ntu.xyz>");
> > +MODULE_DESCRIPTION("SG Micro SGM3140 charge pump led driver");
> > +MODULE_LICENSE("GPL v2");




